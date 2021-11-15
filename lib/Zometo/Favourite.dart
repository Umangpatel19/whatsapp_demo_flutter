import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:watsup/class/UserResponse1.dart';

import 'RestaurantItemView.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key key, String iList1}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  SharedPreferences pref;
  UserResponse1 users;

  @override
  void initState() {
    initPref();
    super.initState();
  }

  initPref() async {
    pref = await SharedPreferences.getInstance();
    users = pref.getString("listData") == null
        ? null
        : UserResponse1.fromJson(jsonDecode(pref.getString("listData")));
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "favourite",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: dis(),
    );
  }

  dis() {
    return users == null
        ? Container()
        : users.users == null
            ? Container()
            : SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    users.users.length,
                    (index) {
                      return RestaurantItemView(
                        details: users.users[index],
                        isBookmarked: true,
                        onBookmarkTap: () {
                          users.users.removeAt(index);
                          pref.setString("listData",
                              jsonEncode(UserResponse1(users: users.users)));
                          if (mounted) setState(() {});
                        },
                      );
                    },
                  ),
                ),
              );
  }
}
