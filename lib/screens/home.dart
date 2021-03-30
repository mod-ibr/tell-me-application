import 'package:flutter/material.dart';
import 'package:tell_me/screens/settings.dart';
import 'package:tell_me/screens/sign2text.dart';
import 'package:tell_me/screens/text2sign.dart';
import 'package:tell_me/screens/video2text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.teal[900],
              size: 25,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Settings()));
            }),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  'assets/images/background0.jpg',
                  fit: BoxFit.fill,
                )),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.grey.withOpacity(0.0),
                        Colors.black,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ])),
              child: SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Raisedbutton(
                      navigat: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => Text2Sign()));
                      },
                      icon: Icon(Icons.text_format),
                      label: 'Text  ',
                      fontSize: 23,
                    ),
                    Sizedbox(),
                    Raisedbutton(
                        navigat: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => Sign2text()));
                        },
                        icon: Icon(Icons.accessibility_new),
                        label: 'Sign  ',
                        fontSize: 23),
                    Sizedbox(),
                    Raisedbutton(
                      navigat: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => Video2Text()));
                      },
                      icon: Icon(Icons.videocam),
                      label: 'Video',
                      fontSize: 23,
                    ),
                    Sizedbox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Raisedbutton extends StatelessWidget {
  var navigat;
  Icon icon;
  String label;
  double fontSize;
  Raisedbutton({this.navigat, this.icon, this.label, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      onPressed: navigat,
      icon: icon,
      label: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Text(
          '$label',
          style: TextStyle(fontSize: fontSize),
        ),
      ),
      color: Colors.black,
      textColor: Colors.teal,
      splashColor: Colors.grey,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25), topLeft: Radius.circular(25)),
          side: BorderSide()),
    );
  }
}

class Sizedbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 50);
  }
}
