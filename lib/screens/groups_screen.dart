import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:homeworks/services/api.dart';
import 'package:homeworks/widgets/group_widget.dart';

import '../models/group.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CODESCHOOL',
          style: TextStyle(
              color: Colors.white60, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 95, 64, 146),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.tealAccent.withOpacity(.4)),
        child: FutureBuilder(
          future: Api.getGroup(),
          builder: (BuildContext context, AsyncSnapshot<List<Group>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.error.toString()),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GroupsScreen()));
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Refresh'),
                    )
                  ],
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: SpinKitThreeBounce(
                size: 50,
                color: Colors.black,
              ));
            } else {
              return Column(
                children: [
                  Container(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) =>
                          GroupWidget(data: snapshot.data![index]),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
