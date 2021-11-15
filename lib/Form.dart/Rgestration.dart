import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watsup/Form.dart/Login.dart';

class Rgestration extends StatefulWidget {
  const Rgestration({Key key}) : super(key: key);

  @override
  _RgestrationState createState() => _RgestrationState();
}

class _RgestrationState extends State<Rgestration> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController adress = TextEditingController();

  int gender = -1;

  bool isEmailvalid = true;
  RegExp regExpEmail = new RegExp(
    r'^[a-zA-Z@]+$',
  );

  bool isphonenumervalid = true;
  RegExp regExpphonenumber = new RegExp(
    r'^[a-zA-Za-z0-9. !@#$%^&*()]+$',
  );
  bool isnamevalid = true;
  RegExp regExpname = new RegExp(
    r'^[a-zA-Za-z0-9. !@#$%^&*()]+$',
  );
  bool isadressvalid = true;
  RegExp regExpadress = new RegExp(
    r'^[a-zA-Za-z0-9. !@#$%^&*()]+$',
  );
  bool ispasswordvalid = true;
  RegExp regExppassword = new RegExp(
    r'^[a-zA-Za-z0-9. !@#$%^&*()]+$',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  "assets/New.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 70,
                left: 50,
                child: Column(
                  children: [
                    Text(
                      "Create",
                      textScaleFactor: 3.5,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Account",
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
              regestration(),
            ],
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  regestration() {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextField(
            controller: name,
            onChanged: (value) {
              if (regExpname.hasMatch(value)) {
                isnamevalid = true;
              } else {
                isnamevalid = false;
              }
              setState(() {});
            },
            decoration: decoration(
              "Name",
              isnamevalid ? null : "Invalid name",
            ),
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: 30,
          ),
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
              "Email",
              isEmailvalid ? null : "Invalid email",
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: phonenumber,
            onChanged: (value) {
              if (regExpphonenumber.hasMatch(value)) {
                isphonenumervalid = true;
              } else {
                isphonenumervalid = false;
              }
              setState(() {});
            },
            decoration: decoration(
              "Phone ",
              isphonenumervalid ? null : "Invalid number",
            ),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: adress,
            onChanged: (value) {
              if (regExpadress.hasMatch(value)) {
                isadressvalid = true;
              } else {
                isadressvalid = false;
              }
              setState(() {});
            },
            decoration: decoration(
              "Adrees",
              isadressvalid ? null : "Invalid adress",
            ),
            keyboardType: TextInputType.streetAddress,
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: password,
            onChanged: (value) {
              if (regExppassword.hasMatch(value)) {
                ispasswordvalid = true;
              } else {
                ispasswordvalid = false;
              }
              setState(() {});
            },
            decoration: decoration(
              "Password",
              ispasswordvalid ? null : "Invalid Password",
            ),
            keyboardType: TextInputType.streetAddress,
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Gender",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textScaleFactor: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text(
                        "MALE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      activeColor: Color(0xfffc5185),
                      value: 0,
                      groupValue: gender,
                      onChanged: (val) {
                        gender = val;
                        if (mounted) setState(() {});
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text(
                        "FEMALE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      activeColor: Color(0xfffc5185),
                      value: 1,
                      groupValue: gender,
                      onChanged: (val) {
                        if (mounted)
                          setState(() {
                            gender = val;
                          });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 45,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, MaterialPageRoute(builder: (_) {
                        return Login();
                      }));
                    },
                    child: Text(
                      "Register",
                      textScaleFactor: 2.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              TextButton(
                child: Text(
                  "Login",
                  textScaleFactor: 1.5,
                ),
                onPressed: () {
                  Navigator.pop(context, MaterialPageRoute(builder: (_) {
                    return Login();
                  }));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  decoration(
    String hintText,
    errorText,
  ) {
    return InputDecoration(
        disabledBorder: border(Colors.black),
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontStyle: FontStyle.normal,
        ),
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
