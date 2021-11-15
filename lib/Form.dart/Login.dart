import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watsup/Form.dart/BackGround.dart';
import 'package:watsup/Form.dart/Rgestration.dart';
import 'package:watsup/Form.dart/UserDetails.dart';
import 'package:watsup/Form.dart/UserResponse.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  SharedPreferences prefs;

  bool isEmailvalid = true;
  RegExp regExpEmail = new RegExp(
    r'^[a-zA-Z@]+$',
  );

  bool ispasswordvalid = true;
  RegExp regExpPassword = new RegExp(
    r'^[a-zA-Za-z0-9. !@#$%^&*()]+$',
  );

  @override
  void initState() {
    initPref();
    super.initState();
  }

  initPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  "assets/New Project.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 110,
                left: 50,
                child: Column(
                  children: [
                    Text(
                      "Hello",
                      textScaleFactor: 3.5,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Again!",
                          textScaleFactor: 3.5,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 105,
                  right: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 80,
                      width: 80,
                      color: Color(0xFFfce38a),
                    ),
                  )),
              fild(),
            ],
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  fild() {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextField(
            controller: email,
            onChanged: (value) {
              if (regExpEmail.hasMatch(value)) {
                isEmailvalid = true;
              } else {
                isEmailvalid = false;
              }
              setState(() {});
            },
            decoration: decoration(
                "Email", isEmailvalid ? null : "Invalid email", true),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: password,
            onChanged: (value) {
              if (regExpPassword.hasMatch(value)) {
                ispasswordvalid = true;
              } else {
                ispasswordvalid = false;
              }
              setState(() {});
            },
            decoration: decoration(
              "Password",
              ispasswordvalid ? null : "Invalid password",
              true,
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          SizedBox(
            height: 100,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      onLoginTap();
                    },
                    child: Text(
                      "Login",
                      textScaleFactor: 3,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      child: Text(
                        "Regester",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Rgestration();
                        }));
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            textBaseline: TextBaseline.ideographic,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  onLoginTap() {
    if (email.text.isEmpty) {
      print("please enter email");
    } else if (password.text.isEmpty) {
      print("please enter password");
    } else {
      login();
    }
  }

  login() async {
    await prefs.setString(
        "userLogin", jsonEncode(UserDetails(email.text, password.text)));
    List<UserDetails> users = [
      UserDetails("1", password.text),
      UserDetails("2", password.text),
      UserDetails("3", password.text),
      UserDetails("4", password.text),
    ];

    await prefs.setString("listData", jsonEncode(UserResponse(users: users)));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return BackGround();
        },
      ),
    );
  }

  decoration(
    String hintText,
    errorText,
    enabled,
  ) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black38,
          fontStyle: FontStyle.normal,
        ),
        enabled: enabled,
        fillColor: Colors.transparent,
        filled: true,
        errorText: errorText);
  }

  InputBorder border(Color color) {
    return OutlineInputBorder(
      gapPadding: 1,
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
