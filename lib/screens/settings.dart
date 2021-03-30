import 'package:flutter/material.dart';
import 'package:tell_me/drawers.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Settings', style: TextStyle(color: Colors.teal[900])),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.teal[900]),
      ),
      drawer: Drawers(),
    );
  }
}
