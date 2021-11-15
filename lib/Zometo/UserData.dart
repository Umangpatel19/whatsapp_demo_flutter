import 'package:flutter/material.dart';
import 'package:watsup/Zometo/User.dart';

class UserData extends StatefulWidget {
  const UserData({Key key}) : super(key: key);

  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  int visibletag = -1;
  List<String> name = ["apple", "orange", "green", "blue"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List data"),
      ),
      body: info(),
    );
  }

  info() {
    return ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index) {
          return User(
              title: name[index],
              visibletag: visibletag == index,
              otap: () {
                setState(() {
                  if (visibletag == index) {
                    visibletag = -1;
                  } else {
                    visibletag = index;
                  }
                });
              });
        });
  }
}
