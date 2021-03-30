import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tell_me/buttons.dart';
import 'package:tell_me/drawers.dart';
import 'package:tell_me/sResultWidget.dart';
import 'package:vibration/vibration.dart';

//  prinText()  {
//   var concatenate = StringBuffer();
//   printText.forEach((item) {
//     concatenate.write(item);
//   });
//   result = concatenate.toString();
//   print(result);
// }

class Sign2text extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sprovider = Provider.of<ResultProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            Text(' Sign to Text ', style: TextStyle(color: Colors.teal[900])),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.teal[900]),
      ),
      drawer: Drawers(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // result area
          TextArea(),
          // Text Field Area
          SignArea(),
          // Task buttons
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 4, right: 4, top: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(
                  // Speaker
                  buttonColor: Colors.teal.withOpacity(0.3),
                  buttonicon: Icons.campaign,
                  subtitle: "Speaker",
                  iconSize: 20,
                  onTap: () {
                    sprovider.speak();
                  },
                ),
                button(
                  // clean
                  buttonColor: Colors.teal.withOpacity(0.3),
                  buttonicon: Icons.delete_outline_rounded,
                  subtitle: "Clean",
                  iconSize: 20,
                  onTap: () {
                    Vibration.vibrate(duration: 50);
                    sprovider.clean();
                  },
                ),
              ],
            ),
          ),
          // keyboard
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.3,
            decoration: BoxDecoration(
              color: Colors.teal[900],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: keyBoardNumber,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: keyboardSign1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: keyboardSign2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: keyboardSign3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: keyboardSign4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Start sign area result
class SignArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sprovider = Provider.of<ResultProvider>(context);
    return Expanded(
      child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 1, bottom: 3, left: 4, right: 4),
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.grey[350].withOpacity(0.3),
            border: Border.all(color: Colors.teal, width: 2),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(2),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: ListView(
            children: <Widget>[
              Wrap(
                runSpacing: 5.0,
                direction: Axis.horizontal,
                children: sprovider.printSign,
              ),
            ],
          )),
    );
  }
}

// Start Text area result
class TextArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sprovider = Provider.of<ResultProvider>(context);
    return Container(
        height: 85,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 5, bottom: 1, left: 4, right: 4),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.teal, width: 2),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5)),
        ),
        child: SelectableText(
          sprovider.result,
          style: TextStyle(
              color: sprovider.result == "Tell Me"
                  ? Colors.grey.withOpacity(0.8)
                  : Colors.teal[900],
              fontSize: 20),
        ));
  }
}

// End Text area result
