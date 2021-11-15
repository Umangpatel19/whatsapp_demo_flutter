import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watsup/Form.dart/UserResponse.dart';
import 'package:watsup/class/Details.dart';
import 'package:watsup/Zometo/RestaurantItemView.dart';
import 'package:watsup/class/UserResponse1.dart';

class Order extends StatefulWidget {
  const Order({Key key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<Details> item = [
    Details("flutter ", "assets/th.jpg"),
    Details("demo ", "assets/th (1).jpg"),
    Details("zometo  ", "assets/th (2).jpg"),
    Details("fapple ", "assets/th (3).jpg"),
    Details("red ", "assets/th (4).jpg"),
    Details("data ", "assets/th (5).jpg"),
  ];

  SharedPreferences pref;
  List<Details> savedList = [];

  @override
  void initState() {
    initPref();
    super.initState();
  }

  initPref() async {
    pref = await SharedPreferences.getInstance();
    savedList = pref.getString("listData") == null
        ? []
        : UserResponse.fromJson(jsonDecode(pref.getString("listData"))).users;
    if (mounted) setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.location_on_outlined,
            color: Colors.red,
          ),
          title: Text(
            "zometo",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(padding: EdgeInsets.all(20)),
            Icon(
              Icons.cake_rounded,
              color: Colors.red,
            )
          ],
        ),
        body: searchfild());
  }

  Widget searchfild() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 60,
            color: Colors.transparent,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(width: 40)),
                  hintText: "SEARCH ",
                  prefixIcon: Icon(Icons.search_sharp),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.mic),
                    onPressed: () {
                      print("object");
                    },
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                onTap: () {}),
          ),
          Column(
            children: List.generate(
              item.length,
              (index) {
                return RestaurantItemView(
                  details: item[index],
                  isBookmarked: savedList != null
                      ? savedList.firstWhere((element) {
                            return element.name == item[index].name;
                          }, orElse: () {
                            return null;
                          }) !=
                          null
                      : false,
                  onBookmarkTap: () {
                    ontap(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ontap(int index) {
    print("abc");
    setState(() async {
      if (savedList.firstWhere((element) {
            return element.name == item[index].name;
          }, orElse: () {
            return null;
          }) ==
          null) {
        print("0");
        savedList.add(item[index]);
        pref.setString("listData", jsonEncode(UserResponse1(users: savedList)));
        if (mounted) setState(() {});
      } else {
        print("1");
        int savedListIndex = -1;
        await Future.forEach(savedList, (Details element) {
          if (item[index].name == element.name) {
            savedListIndex = savedList.indexOf(element);
          }
        });
        print(savedList.removeAt(savedListIndex));
        pref.setString("listData", jsonEncode(UserResponse1(users: savedList)));

        if (mounted) setState(() {});
      }
    });
  }
}
