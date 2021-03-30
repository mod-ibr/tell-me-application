import 'package:flutter/material.dart';
import 'package:tell_me/screens/home.dart';
import 'package:tell_me/screens/settings.dart';
import 'package:tell_me/screens/sign2text.dart';
import 'package:tell_me/screens/text2sign.dart';
import 'package:tell_me/screens/video2text.dart';

class Drawers extends StatefulWidget {
  @override
  _DrawersState createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.grey.withOpacity(0.8),
                Colors.grey.withOpacity(0.0),
              ],
              stops: [
                0.0,
                1.0
              ])),
      child: Column(children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/icon1.png",
                  width: 210,
                  height: 210,
                  fit: BoxFit.fill,
                ),
                Text(
                  "Tell Me",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.teal[900]),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "The easiest ways to communicate",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.teal[900]),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        //Now let's Add the button for the Menu
        //and let's copy that and modify it
        Divider(
          color: Colors.teal[900],
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Home()));
          },
          leading: Icon(
            Icons.home,
            color: Colors.teal[900],
          ),
          title: Text("Home",
              style: TextStyle(fontSize: 25, color: Colors.teal[900])),
        ),
        Divider(
          color: Colors.teal[900],
          height: 15,
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Text2Sign()));
          },
          leading: Icon(
            Icons.text_format,
            color: Colors.teal[900],
          ),
          title: Text("Text to Sign",
              style: TextStyle(fontSize: 25, color: Colors.teal[900])),
        ),
        Divider(
          color: Colors.teal[900],
          height: 15,
        ),

        ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Sign2text()));
          },
          leading: Icon(
            Icons.accessibility_new,
            color: Colors.teal[900],
          ),
          title: Text("Sign to Text",
              style: TextStyle(fontSize: 25, color: Colors.teal[900])),
        ),
        Divider(
          color: Colors.teal[900],
          height: 15,
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Video2Text()));
          },
          leading: Icon(
            Icons.videocam,
            color: Colors.teal[900],
          ),
          title: Text("Video to Text",
              style: TextStyle(fontSize: 25, color: Colors.teal[900])),
        ),
        Divider(
          color: Colors.teal[900],
          height: 15,
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Settings()));
          },
          leading: Icon(
            Icons.settings,
            color: Colors.teal[900],
          ),
          title: Text("Settings",
              style: TextStyle(fontSize: 25, color: Colors.teal[900])),
        ),
        Divider(
          color: Colors.teal[900],
          height: 15,
        ),
      ]),
    ));
  }
}
