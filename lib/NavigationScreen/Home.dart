import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:watsup/NavigationScreen/Menu_Page.dart';
import 'package:watsup/NavigationScreen/Payment_Page.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      borderRadius: 30,
      style: DrawerStyle.Style7,
      mainScreen: Payment_Page(),
      menuScreen: Menu_page(),
    );
  }
}
