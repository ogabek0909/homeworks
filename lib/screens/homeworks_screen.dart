import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:homeworks/services/api.dart';
import 'package:homeworks/widgets/homework_widget.dart';

class HomeworksScreen extends StatelessWidget {
  const HomeworksScreen({super.key});
  static const routeName = 'homeworksScreen';

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeWorks'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 95, 64, 146),
      ),
      body: Container(
        color: Colors.lightGreen.shade200,
        child: FutureBuilder(
          future: Api.getHomework(argument as int),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return  const Center(
                child: SpinKitThreeBounce(
                  size: 50,
                  color: Colors.black,
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => HomeworkWidget(data: snapshot.data![index],groupId:argument)
              );
            }
          },
        ),
      ),
    );
  }
}
