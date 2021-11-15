import 'package:flutter/material.dart';
import 'package:watsup/NavigationScreen/Menuwidget/Menu_Widget.dart';

class Payment_Page extends StatefulWidget {
  const Payment_Page({Key key}) : super(key: key);

  @override
  _Payment_PageState createState() => _Payment_PageState();
}

class _Payment_PageState extends State<Payment_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Menu_Widget(),
        title: Text("Payment_Page"),
      ),
      body: Container(),
    );
  }
}
