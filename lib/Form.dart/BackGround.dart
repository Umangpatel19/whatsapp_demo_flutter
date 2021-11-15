import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watsup/Form.dart/Login.dart';
import 'package:watsup/Form.dart/UserDetails.dart';

import 'UserResponse.dart';

class BackGround extends StatefulWidget {
  const BackGround({Key key}) : super(key: key);

  @override
  _BackGroundState createState() => _BackGroundState();
}

class _BackGroundState extends State<BackGround> {
  SharedPreferences prefs;
  UserDetails userDetails;
  UserResponse userResponse;

  @override
  void initState() {
    initPref();
    super.initState();
  }

  initPref() async {
    prefs = await SharedPreferences.getInstance();
    userDetails = UserDetails.fromJson(
      jsonDecode(
        prefs.getString("userLogin"),
      ),
    );
    userResponse =
        UserResponse.fromJson(jsonDecode(prefs.getString("listData")));
    userResponse.users.forEach((element) {
      print(element.email);
    });
    print(prefs.getString("listData"));
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Image.asset("assets/New Project.jpg"),
          ),
          Text(userDetails == null ? "" : userDetails.email),
          Text(userDetails == null ? "" : userDetails.password),
          TextButton(
            onPressed: () async {
              await prefs.clear();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return Login();
                  },
                ),
                (Route<dynamic> route) => false,
              );
            },
            child: Text("Logout"),
          )
        ],
      ),
    );
  }
}
