import 'package:flutter/material.dart';
import 'package:watsup/NavigationScreen/Class/Menuitems.dart';

class Menu_page extends StatefulWidget {
  const Menu_page({Key key}) : super(key: key);

  @override
  _Menu_pageState createState() => _Menu_pageState();
}

class _Menu_pageState extends State<Menu_page> {
  List<MenuItem> name1 = [
    MenuItem("payment", Icons.payment),
    MenuItem("Promo", Icons.card_giftcard),
    MenuItem("Notifications", Icons.notifications),
    MenuItem("Help", Icons.help),
    MenuItem("About us", Icons.info_outline),
    MenuItem("Rates us", Icons.star_border),
  ];

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: data(),
      ),
    );
  }

  data() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: name1.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return mainpage(index);
          },
        ),
      ],
    );
  }

  mainpage(int index) {
    return Column(
      children: [
        ListTileTheme(
          child: ListTile(
            leading: Icon(
              name1[index].icon,
              color: Colors.white,
            ),
            title: Text(
              name1[index].title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
