import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:tell_me/model/keyboardButton.dart';
import 'package:vibration/vibration.dart';
import 'package:tell_me/buttons.dart';

class ResultProvider with ChangeNotifier {
  List<Widget> printSign = [];
  List printText = [];
  var result = 'Tell Me';
  bool capital = false;

  // keyboard on tap button function
  void keyBoardTap({var l, var s}) {
    if (capital) {
      printText.add(l.toString().toUpperCase());
      printSign.add(ResultSign(
        sign: s,
        labale: l.toString().toUpperCase(),
      ));
    } else {
      printText.add(l.toString());
      printSign.add(ResultSign(
        sign: s,
        labale: l,
      ));
    }
    // printSign.add(ResultSign(
    //   sign: s,
    //   labale: l,
    // ));
    toText();
    Vibration.vibrate(duration: 40);
    notifyListeners();
  }

  void doAction(var label, var sign) {
    Vibration.vibrate(duration: 40);

    switch (label) {
      case "del":
        {
          delete();
        }
        break;
      case "upper":
        {
          upper();
          print('is capital : $capital');
        }
        break;
      case "nextLine":
        {
          if (printText.isNotEmpty) {
            print('new line');
            newLine(s: sign);
          }
        }
        break;
      case "dot":
        {
          dot(s: sign);
        }
        break;

      case "space":
        {
          space(' ', box(w: 10, h: 10));
        }
        break;

      case "comma":
        {
          comma(s: sign);
        }
        break;

      case "apostroph":
        {
          apostro(s: sign);
        }
        break;

      case "lang":
        {
          print('change the language');
        }
        break;
      case "settings":
        {
          print('navigate to settings');
        }
        break;
    }
  }

  // transfer list to text function
  void toText() {
    var concatenate = StringBuffer();
    printText.forEach((item) {
      concatenate.write(item);
    });
    result = concatenate.toString();
    print(result);
  }

// clean button function
  void clean() {
    Vibration.vibrate(duration: 50);
    result = "Tell Me";
    printSign.clear();
    printText.clear();
    notifyListeners();
  }

// delete button function
  void delete() {
    if (printSign.isNotEmpty && printText.isNotEmpty) {
      printText.removeLast();
      printSign.removeLast();
      toText();
      notifyListeners();
    }
    print('T ${printText.length} , S ${printSign.length}');
  }

// delete All button function
  void adelete() {
    if (printSign.isNotEmpty && printText.isNotEmpty) {
      printText.clear();
      printSign.clear();
      toText();
      notifyListeners();
    }
    print('T ${printText.length} , S ${printSign.length}');
  }

// upper case button function
  void upper() {
    capital = !capital;
    notifyListeners();
  }

// space button function
  void space(var p, var box) {
    printText.add(p);
    printSign.add(box);
    toText();
    notifyListeners();
  }

  // new line button function
  void newLine({var s}) {
    printText.add("\n");
    printSign.add(SResultSign(sign: s));
    toText();
    notifyListeners();
  }

  // comma button function
  void comma({var s}) {
    printText.add(",");
    printSign.add(SResultSign(sign: s));
    toText();
    notifyListeners();
  }

  // dot button function
  void dot({var s}) {
    printText.add(".");
    printSign.add(SResultSign(sign: s));
    toText();
    notifyListeners();
  }

  // apostroph button function
  void apostro({var s}) {
    printText.add("'");
    printSign.add(SResultSign(sign: s));
    toText();
    notifyListeners();
  }

// for text to speach
  final FlutterTts fluttertts = FlutterTts();

  Future speak() async {
    await fluttertts.setLanguage("en-US");
    await fluttertts.setPitch(0.9);
    await fluttertts.setSpeechRate(0.8);
    await fluttertts.speak(result.toString());
  }
}
