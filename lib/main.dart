import 'package:flutter/material.dart';
import 'package:watsup/Form.dart/Login.dart';
import 'package:watsup/NavigationScreen/Home.dart';
import 'package:watsup/Zometo/Demo.dart';
import 'package:watsup/Zometo/Design.dart';
import 'package:watsup/Zometo/Show.dart';
import 'package:watsup/Zometo/User.dart';
import 'package:watsup/Zometo/UserData.dart';
import 'package:watsup/newlogin/Profile.dart';
import 'package:watsup/newweb/Huminity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Huminity(),
    );
  }
}

// new changes