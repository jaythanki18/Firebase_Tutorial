import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddScreen extends StatelessWidget {
  AddScreen({Key? key}) : super(key: key);

  List<String> events = [
    "Calender",
    "Family",
    "Friends",
    "Lovely",
    "Me",
    "Team"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        child: GridView(
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: events.map((title) {
            return GestureDetector(
              child: Card(
                  margin: const EdgeInsets.all(20.0),
                  child: getCardByTitle(title)),
              onTap: () {
                Fluttertoast.showToast(
                    msg: title + "click",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              },);
          }).toList(),
        ),
      ),
    );
  }

  Column getCardByTitle(String title) {
    String img = "";
    if (title == "Calender")
      img = "assets/calender.png";
    else if (title == "Family")
      img = "assets/family_time.png";
    else if (title == "Friends")
      img = "assets/friends.jpg";
    else if (title == "Lovely")
      img = "assets/good_time.jpg";
    else if (title == "Me")
      img = "assets/me.jfif";
    else
      img = "assets/team.jfif";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
          child: new Stack(children: <Widget>[
            new Image.asset(img, width: 80.0, height: 80.0,)
          ],),
        ),Text(title,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
      ],
    );
  }
}
