import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Detail Image",
            style: TextStyle(color: Colors.black87),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: disply(),
    );
  }

  disply() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset("assets/photo.jpg"),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey[200],
            ),
            child: ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: Colors.black87,
              ),
              title: Text("12 MEY 2021  1223 ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey[200],
            ),
            child: ListTile(
              leading: Icon(
                Icons.image_outlined,
                color: Colors.black87,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text("Image12343546453232.png",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Image12343546453232.png"),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Image12343546453232.png"),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey[200],
            ),
            child: ListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  color: Colors.black87,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Street Mango , no.102 Block C " +
                            "\n" +
                            "Rt 03 Rw 01,kec Bendering " +
                            "\n" +
                            "kab Mediam ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey[200],
            ),
            child: ListTile(
              leading: Icon(
                Icons.camera_alt_outlined,
                color: Colors.black87,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Sony A600",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("F15 1/25s 30mm iso1000"),
                  SizedBox(
                    height: 15,
                  ),
                  Text("white balance  no flash"),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
