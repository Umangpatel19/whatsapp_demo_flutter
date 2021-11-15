import 'package:flutter/material.dart';

class User extends StatefulWidget {
  String title;
  bool visibletag;
  Function otap;

  User(
      {@required this.title,
      @required this.visibletag,
      @required this.otap,
      Key key})
      : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            shadowColor: Colors.indigo,
            child: ListTile(
              title: Text(widget.title),
              trailing: Icon(widget.visibletag
                  ? Icons.arrow_upward_sharp
                  : Icons.arrow_downward_sharp),
              onTap: () {
                widget.otap();
              },
            ),
          ),
          widget.visibletag
              ? Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Card(
                        shadowColor: Colors.yellow,
                        elevation: 5,
                        child: ListTile(
                          title: Text("option-1"),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Card(
                        elevation: 5,
                        shadowColor: Colors.yellow,
                        child: ListTile(
                          title: Text("option-2"),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Card(
                        elevation: 5,
                        shadowColor: Colors.yellow,
                        child: ListTile(
                          title: Text("option-3"),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
