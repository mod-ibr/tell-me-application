import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tell_me/sResultWidget.dart';
import 'package:tell_me/screens/home.dart';
import 'package:tell_me/screens/sign2text.dart';
import 'package:tell_me/screens/splashScreen.dart';
import 'package:tell_me/screens/text2sign.dart';
import 'package:provider/provider.dart';
import 'package:tell_me/screens/settings.dart';
import 'package:tell_me/screens/video2text.dart';

List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ResultProvider>(create: (_) => ResultProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Tell Me',
      home: MySplashScreen(),
    );
  }
}
