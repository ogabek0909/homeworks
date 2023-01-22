import 'package:flutter/material.dart';
import 'package:homeworks/models/group.dart';
import 'package:homeworks/screens/homeworks_screen.dart';

class GroupWidget extends StatelessWidget {
  final Group data;
  const GroupWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, colors: [
            Colors.tealAccent.withOpacity(.6),
            Colors.tealAccent.withOpacity(.7),
          ]),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.red),
            BoxShadow(color: Colors.red),
            BoxShadow(color: Colors.red),
          ]),
      child: ListTile(
        title: Text(
          data.name,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        onTap: () {
          
          Navigator.pushNamed(context, HomeworksScreen.routeName,
              arguments: data.id);
        },
      ),
    );
  }
}

//Navigator.pushNamed(context, HomeworksScreen.routeName,arguments: data.id);