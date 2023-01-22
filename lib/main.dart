import 'package:flutter/material.dart';
import 'package:homeworks/screens/homeworks_screen.dart';
import 'package:homeworks/screens/splash_screen.dart';
import 'package:homeworks/screens/students_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const SplshScreen(),
      routes: {
        HomeworksScreen.routeName :(context) => const HomeworksScreen(),
        StudentsScreen.routeName :(context) => const StudentsScreen(),
      },
    );
  }
}
