import 'package:flutter/material.dart';
import 'package:homeworks/models/homework.dart';
import 'package:homeworks/screens/students_screen.dart'; 

class HomeworkWidget extends StatelessWidget {
  final Homework data;
  final int groupId;
  const HomeworkWidget({super.key,required this.data,required this.groupId});

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
          ),
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
          //FadeThroughPageTransitionsBuilder();
          
          Navigator.pushNamed(context, StudentsScreen.routeName,arguments: [groupId,data.id,data.name]);
        },
      ),
    );
  }
}