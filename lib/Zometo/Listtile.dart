import 'package:flutter/material.dart';

class Listtile extends StatefulWidget {
  String title;
  Listtile({@required this.title, Key key}) : super(key: key);

  @override
  _ListtileState createState() => _ListtileState();
}

class _ListtileState extends State<Listtile> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      ListTile(
          title: Text(widget.title),
          onTap: () => setState(() {
                isSelected = !isSelected;
              }) // doing toggle
          ),
      // for each listtile individually, it shows/hide Row accordingly
      isSelected
          ? Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text("Edit"),
              SizedBox(width: 50.0),
              Text("Delete")
            ])
          : Container()
    ]);
  }
}
