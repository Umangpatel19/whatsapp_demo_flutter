import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Menu_Widget extends StatefulWidget {
  const Menu_Widget({Key key}) : super(key: key);

  @override
  _Menu_WidgetState createState() => _Menu_WidgetState();
}

class _Menu_WidgetState extends State<Menu_Widget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          return ZoomDrawer.of(context).toggle();
        });
  }
}
