import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tell_me/sResultWidget.dart';
// class model for button widget
class KeyboardButton extends StatelessWidget {
  var label;
  var sign;
  double signWidth, signHight;
  Color labelColor;
  Function buttonTab;
  Icon iconButton;
  double buttonWidth;
  double leftMargine, rightMargine, topMargine, bottomMargine;

  KeyboardButton(
      {this.label = null,
      this.sign,
      this.signHight = 30,
      this.signWidth = 50,
      this.labelColor,
      this.iconButton,
      this.buttonWidth = 33,
      this.bottomMargine = 0,
      this.topMargine = 2,
      this.leftMargine = 2,
      this.rightMargine = 0,
      this.buttonTab});

  @override
  Widget build(BuildContext context) {
    var sprovider = Provider.of<ResultProvider>(context );
    return Container(
        margin: EdgeInsets.only(
            left: leftMargine,
            bottom: bottomMargine,
            top: topMargine,
            right: rightMargine),
        width: buttonWidth,
        // height: 40,
        decoration: BoxDecoration(
          color: sprovider.capital ? Colors.teal : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          children: <Widget>[
            Card(
              elevation: 0,
              child: Column(
                children: [
                  Image.asset(
                    sign,
                    width: signWidth,
                    height: signHight,
                    fit: BoxFit.fill,
                  ),
                  Text(label),
                ],
              ),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    sprovider.keyBoardTap(s: sign, l: label);
                  },
                  splashColor: Colors.teal,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ));
  }
}

//for sign with label
class ResultSign extends StatelessWidget {
  var sign;
  String labale;

  ResultSign({this.labale, this.sign});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, top: 5),
      child: Column(
        children: [
          Image.asset(
            sign,
            width: 25,
            height: 25,
          ),
          SizedBox(height: 1),
          Text(
            labale,
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}

//for sign without label
class SResultSign extends StatelessWidget {
  var sign;

  SResultSign({this.sign});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, top: 5),
      child: Column(
        children: [
          Image.asset(
            sign,
            width: 25,
            height: 25,
          ),
          SizedBox(height: 1),
        ],
      ),
    );
  }
}
// for space widget
class box extends StatelessWidget {
  double w, h;

  box({this.w, this.h});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
    );
  }
}
