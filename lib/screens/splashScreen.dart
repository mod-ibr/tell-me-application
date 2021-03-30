import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tell_me/screens/home.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SplashScreen(
      navigateAfterSeconds: Home(),
      seconds: 5,
      imageBackground: Image.asset("assets/images/splash.jpg",
              width: width/2 ,height: height/2, fit: BoxFit.cover)
          .image,
      useLoader: true,
      loaderColor: Colors.teal[900],
    );
  }
}
