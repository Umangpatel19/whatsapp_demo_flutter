import 'package:flutter/material.dart';

class Show extends StatefulWidget {
  Show({Key key}) : super(key: key);

  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {
  bool visibilityTag = false;
  bool visibilityTag1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: info(),
    );
  }

  info() {
    return ListView(
      children: [
        Expanded(
          child: Card(
            child: ListTile(
              title: Text("data"),
              onTap: () {
                setState(() {
                  visibilityTag = !visibilityTag;
                });
              },
              trailing: Icon(visibilityTag
                  ? Icons.arrow_drop_up_outlined
                  : Icons.arrow_drop_down_rounded),
            ),
          ),
        ),
        visibilityTag
            ? Container(
                child: Column(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text("option"),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("option"),
                      ),
                    ),
                  ],
                ),
              )
            : Container(color: Colors.red),
        Expanded(
          child: Card(
            child: ListTile(
              title: Text("data"),
              onTap: () {
                setState(() {
                  visibilityTag1 = !visibilityTag1;
                });
              },
              trailing: Icon(visibilityTag1
                  ? Icons.arrow_drop_up_outlined
                  : Icons.arrow_drop_down_rounded),
            ),
          ),
        ),
        visibilityTag1
            ? Container(
                child: Column(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text("option1"),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("option1"),
                      ),
                    ),
                  ],
                ),
              )
            : Container(color: Colors.red),
      ],
    );
  }
}
