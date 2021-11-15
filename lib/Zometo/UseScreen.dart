import 'package:flutter/material.dart';

class UseScreen extends StatefulWidget {
  String title;
  bool visibilityTag;
  Function onTap;
  UseScreen({
    @required this.title,
    @required this.visibilityTag,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  @override
  _UseScreenState createState() => _UseScreenState();
}

class _UseScreenState extends State<UseScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: ListTile(
            title: Text(widget.title),
            trailing: Icon(widget.visibilityTag
                ? Icons.arrow_circle_up_outlined
                : Icons.arrow_circle_down_outlined),
            onTap: () {
              widget.onTap();
            },
          ),
        ),
        widget.visibilityTag
            ? Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Card(
                      shadowColor: Colors.grey[900],
                      child: ListTile(
                        title: Text("option-1"),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      shadowColor: Colors.grey[900],
                      child: ListTile(
                        title: Text("option-2"),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      shadowColor: Colors.grey[900],
                      child: ListTile(
                        title: Text("option-3"),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
}
