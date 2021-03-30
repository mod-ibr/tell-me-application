import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tell_me/buttons.dart';
import 'package:tell_me/drawers.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class Text2Sign extends StatefulWidget {
  @override
  _Text2SignState createState() => _Text2SignState();
}

class _Text2SignState extends State<Text2Sign> {
  // Start Speech To Text
  stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) {
          print('onStatus: $val');
          if (val == 'notListening') {
            setState(() => _isListening = false);
          }
        },
        onError: (val) {
          print('onError: $val');
          setState(() => _isListening = false);
        },
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            textController.text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
    setState(() {
      _text = null;
    });
  }

// End Speech To Text

  bool lang = true;
  var result = 'Tell Me';

  TextEditingController textController = TextEditingController();

  // dispose function to clear your textController.text


// translate Function
  void translate() {
    setState(() {
      result = textController.text;
    });
  }

// transform Function
  void langTransform() {
    setState(() {
      (lang) ? lang = false : lang = true;
    });
  }

// clean function
  void clean() {
    setState(() {
      result = "Tell Me";
      textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Text to Sign', style: TextStyle(color: Colors.teal[900])),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.teal[900]),
      ),
      drawer: Drawers(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // result area
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 10, bottom: 0, left: 8, right: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[350].withOpacity(0.3),
                border: Border.all(color: Colors.teal, width: 2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
              ),
              child: ListView(children: [
                Text(
                  '$result',
                    style: result == 'Tell Me'
                        ? TextStyle(color: Colors.teal[900].withOpacity(0.5), fontSize: 25)
                        : TextStyle(color: Colors.teal[900], fontSize: 25),
                )
              ]),
            ),
          ),
          // Text Field Area
          Container(
            margin: EdgeInsets.only(top: 5, right: 8, left: 8, bottom: 2),
            child: TextField(
              controller: textController,
              enabled: true, // to trigger disabledBorder
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF2F2F2),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  borderSide: BorderSide(width: 2, color: Colors.teal),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  borderSide: BorderSide(width: 1, color: Colors.teal),
                ),
                hintText: lang
                    ? "Enter Your Text here In English "
                    : "Enter Your Text here In Arabic ",
                hintStyle: TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
              ),
              // onTap: hideWidget,
              // onEditingComplete: changedDone,
            ),
          ),
          // task Par are
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 5),
            padding: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              border: Border.all(color: Colors.teal, width: 1),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AvatarGlow(
                  animate: _isListening,
                  glowColor: Colors.redAccent,
                  endRadius: 27,
                  duration: const Duration(milliseconds: 5000),
                  repeatPauseDuration: const Duration(milliseconds: 50),
                  repeat: true,
                  showTwoGlows: true,
                  child: button(
                    // mic
                    buttonColor: _isListening ? Colors.red : Colors.green,
                    buttonicon: _isListening ? Icons.mic : Icons.mic_none,
                    subtitle: "Mic",
                    iconSize: 20,
                    onTap: _listen,
                  ),
                ),
                // button(
                //   // transform
                //   buttonColor: Colors.white,
                //   buttonicon: Icons.compare_arrows_sharp,
                //   subtitle: lang ? 'English' : 'Arabic ',
                //   iconSize: 20,
                //   onTap: langTransform,
                // ),
                button(
                  // translate
                  buttonColor: Colors.white,
                  buttonicon: Icons.translate,
                  subtitle: "Translate",
                  iconSize: 20,
                  onTap: translate,
                ),
                button(
                  // clean
                  buttonColor: Colors.white,
                  buttonicon: Icons.delete_outline_rounded,
                  subtitle: "Clean",
                  iconSize: 20,
                  onTap: clean,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Inkwell  And  Button at the end to handel this issue

