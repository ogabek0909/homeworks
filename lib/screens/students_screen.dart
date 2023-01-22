import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:homeworks/services/api.dart';
import 'package:homeworks/widgets/student_widget.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});
  static const routeName = 'studentsScreen';

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 95, 64, 146),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: Api.getStudent(argument[0], argument[1]),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.error.toString()),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_left_rounded),
                    label: const Text('Back'),
                  )
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SpinKitThreeBounce(
                color: Colors.black,
                size: 50,
              ),
            );
          } else {
            return snapshot.data!.isNotEmpty
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Homework: ${argument[2]}',
                              style: const TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          StudentWidget(data: snapshot.data!),
                        ],
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        'Something is wrong! or maybe no one has forked',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
          }
        },
      ),
    );
  }
}
