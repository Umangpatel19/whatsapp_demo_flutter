import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Huminity extends StatefulWidget {
  const Huminity({Key key}) : super(key: key);

  @override
  _HuminityState createState() => _HuminityState();
}

class _HuminityState extends State<Huminity> {
  List<String> items = [
    "https://images.unsplash.com/photo-1535726858289-9ffe2dff6f52?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTR8fGNoaWxkcmVuJTIwcGxheWluZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1623604407437-d8fce3bc61de?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDF8fGNoaWxkcmVuJTIwcGxheWluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1613794713137-a78aba4be84a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGNoaWxkcmVuJTIwcGxheWluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1516240562813-7d658edb7239?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNoaWxkcmVuJTIwcGxheWluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1489710437720-ebb67ec84dd2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y2hpbGRyZW4lMjBwbGF5aW5nfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1440288736878-766bd5839edb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2hpbGRyZW4lMjBwbGF5aW5nfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1533222481259-ce20eda1e20b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y2hpbGRyZW4lMjBwbGF5aW5nfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  ];
  bool sizeBool = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        title: Row(
          children: [
            SizedBox(
              width: 50,
            ),
            Text(
              "HUMINITY",
              style: TextStyle(color: Colors.black87, fontSize: 40),
            ),
            SizedBox(
              width: 450,
            ),
            text("Home"),
            SizedBox(
              width: 50,
            ),
            text("About us"),
            SizedBox(
              width: 50,
            ),
            text("Services"),
            SizedBox(
              width: 50,
            ),
            text("Gallery"),
            SizedBox(
              width: 50,
            ),
            text("Blog"),
            SizedBox(
              width: 50,
            ),
            text("Contact us"),
          ],
        ),
      ),
      body: info(),
    );
  }

  text(String name) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      hoverColor: Colors.blue,
      onTap: () {
        setState(() {
          print("object");
        });
      },
      onHover: (sizeBool) {
        if (sizeBool) {
          setState(() {
            sizeBool = !sizeBool;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height / 15,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          name,
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }

  info() {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: 10,
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        child: Container(
          child: Column(
            children: [
              slider(),
              block(),
            ],
          ),
        ),
      ),
    );
  }

  block() {
    return Container(
      child: Column(
        children: [
          Column(
            children: [Text("data")],
          ),
        ],
      ),
    );
  }

  slider() {
    return CarouselSlider.builder(
      options: CarouselOptions(
          autoPlayCurve: Curves.linearToEaseOut,
          viewportFraction: 1,
          enlargeCenterPage: true,
          disableCenter: true,
          height: 500,
          autoPlay: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          enlargeStrategy: CenterPageEnlargeStrategy.height),
      itemCount: items.length,
      itemBuilder: (context, itemIndex, realIndex) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          margin: EdgeInsets.all(20),
          child: Image.network(
            items[itemIndex],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
