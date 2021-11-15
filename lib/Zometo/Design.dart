import 'package:flutter/material.dart';

import 'package:watsup/Zometo/UseScreen.dart';
import 'package:watsup/class/ItemView.dart';

class Desing extends StatefulWidget {
  const Desing({Key key}) : super(key: key);

  @override
  _DesingState createState() => _DesingState();
}

class _DesingState extends State<Desing> {
  int visibilityTag = -1;

  List<Itemview> items = [
    Itemview("Item1", false),
    Itemview("Item2", false),
    Itemview("Item2", false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: dislpy(),
    );
  }

  dislpy() {
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return UseScreen(
          title: items[index].title,
          visibilityTag: visibilityTag == index,
          onTap: () {
            setState(() {
              if (visibilityTag == index) {
                visibilityTag = -1;
              } else {
                visibilityTag = index;
              }
            });
          },
        );
      },
    );
  }
}
