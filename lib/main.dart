
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_courses.dart';
import 'login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exam',
      debugShowCheckedModeBanner: false,
      routes: {
        "/Home" : (BuildContext context) => Login(),
        // "/Udemy_Courses" : (BuildContext context) => UdemyCourses(),

      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Login() ,
    );
  }
}