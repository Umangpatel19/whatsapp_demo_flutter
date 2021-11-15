import 'package:flutter/material.dart';
import 'package:watsup/class/Details.dart';

class RestaurantItemView extends StatefulWidget {
  Details details;
  bool isBookmarked;
  Function onBookmarkTap;
  RestaurantItemView({
    @required this.details,
    @required this.isBookmarked,
    @required this.onBookmarkTap,
    Key key,
  }) : super(key: key);

  @override
  _RestaurantItemViewState createState() => _RestaurantItemViewState();
}

class _RestaurantItemViewState extends State<RestaurantItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height / 2.8,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        shadowColor: Colors.red[600],
        child: GridTile(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            margin: EdgeInsets.only(bottom: 70),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.asset(
                widget.details.iList1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          header: ListTile(
            trailing: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(widget.isBookmarked
                    ? Icons.bookmark
                    : Icons.bookmark_outline_sharp),
                onPressed: () {
                  widget.onBookmarkTap();
                },
              ),
            ),
          ),
          footer: ListTile(
            title: Text(widget.details.name),
            subtitle: Text("Arabian,Mughlai"),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("data"),
                Column(
                  children: [Text("data")],
                ),
              ],
            ),
          ),
        ),
        borderOnForeground: false,
      ),
    );
  }
}
