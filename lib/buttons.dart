import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tell_me/model/keyboardButton.dart';
import 'package:tell_me/sResultWidget.dart';
import 'package:vibration/vibration.dart';
import 'package:tell_me/screens/sign2text.dart';
import 'package:tell_me/screens/settings.dart';


// for taskbar
class button extends StatelessWidget {
  Color buttonColor;
  var buttonicon;
  Function onTap;
  String subtitle;
  double iconSize;

  button(
      {this.buttonColor,
      this.buttonicon,
      this.subtitle,
      this.iconSize,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Material(
            color: buttonColor, // button color
            child: InkWell(
              splashColor: Colors.redAccent, // inkwell color
              child: SizedBox(
                width: 36,
                height: 36,
                child: Center(
                    child: Icon(
                  buttonicon,
                  size: iconSize,
                  color: Colors.teal[900],
                )),
              ),
              onTap: onTap,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Text(
            subtitle,
            style: TextStyle(
                color: Colors.teal[900].withOpacity(0.5), fontSize: 12),
          ),
        )
      ],
    );
  }
}

List<Widget> keyBoardNumber = [
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/1.png',
    leftMargine: 2,
    label: '1',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/2.png',
    label: '2',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/3.png',
    label: '3',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/4.png',
    label: '4',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/5.png',
    label: '5',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/6.png',
    label: '6',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/7.png',
    label: '7',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/8.png',
    label: '8',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/9.png',
    label: '9',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/0.png',
    label: '0',
    rightMargine: 2,
  ),
];
List<Widget> keyboardSign1 = [
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/q.png',
    leftMargine: 2,
    label: 'q',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/w.png',
    label: 'w',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/e.png',
    label: 'e',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/r.png',
    label: 'r',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/t.png',
    label: 't',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/y.png',
    label: 'y',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/u.png',
    label: 'u',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/i.png',
    label: 'i',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/o.png',
    label: 'o',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/p.png',
    label: 'p',
  ),
];
List<Widget> keyboardSign2 = [
  box(w: 15, h: 50),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/a.png',
    leftMargine: 2,
    label: 'a',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/s.png',
    label: 's',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/d.png',
    label: 'd',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/f.png',
    label: 'f',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/g.png',
    label: 'g',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/h.png',
    label: 'h',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/j.png',
    label: 'j',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/k.png',
    label: 'k',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/l.png',
    label: 'l',
  ),
  box(w: 15, h: 50),
];
List<Widget> keyboardSign3 = [
  AButton(
    label: "upper",
    sign: 'assets/images/SL/ASL/black/up1.png',
    w: 33,
    h: 55,
    signH: 30,
    signW: 50,
    tap: () {},
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/z.png',
    label: 'z',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/x.png',
    label: 'x',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/c.png',
    label: 'c',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/v.png',
    label: 'v',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/b.png',
    label: 'b',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/n.png',
    label: 'n',
  ),
  KeyboardButton(
    sign: 'assets/images/SL/ASL/black/m.png',
    label: 'm',
  ),
  AButton(
    label: "del",
    sign: 'assets/images/SL/ASL/black/delete1.png',
    w: 33,
    h: 55,
    signH: 30,
    signW: 50,
    tap: () {},
  ),
];
List<Widget> keyboardSign4 = [
  AButton(
    label: "settings",
    sign: 'assets/images/SL/ASL/black/settings1.png',
    w: 33,
    h: 55,
    signH: 30,
    signW: 50,
    tap: () {
      // Navigator.of(context).push(route);
    },
  ),
  AButton(
    label: "lang",
    sign: 'assets/images/SL/ASL/black/lang1.png',
    w: 33,
    h: 55,
    signH: 30,
    signW: 30,
    tap: () {},
  ),
  AButton(
    label: "apostroph",
    sign: 'assets/images/SL/ASL/black/apostro1.png',
    w: 33,
    h: 55,
    signH: 30,
    signW: 50,
    tap: () {},
  ),
  AButton(
    label: "comma",
    sign: 'assets/images/SL/ASL/black/comma1.png',
    w: 33,
    h: 55,
    signH: 50,
    signW: 50,
    tap: () {},
  ),
  AButton(
    label: 'space',
    sign: 'assets/images/SL/ASL/black/spaceA1.png',
    w: 140,
    h: 55,
    signH: 120,
    signW: 120,
    tap: () {},
  ),
  AButton(
    label: 'dot',
    sign: 'assets/images/SL/ASL/black/dot1.png',
    w: 33,
    h: 55,
    signH: 120,
    signW: 120,
    tap: () {},
  ),
  AButton(
    label: "nextLine",
    sign: 'assets/images/SL/ASL/black/nextLine1.png',
    w: 33,
    h: 55,
    signH: 120,
    signW: 120,
    tap: () {},
  ),
];

class AButton extends StatelessWidget {
  var sign;
  var label;
  double w, h;
  double signW, signH;
  Function tap;

  AButton({
    this.label,
    this.sign,
    this.w = 33,
    this.h = 55,
    this.signW,
    this.signH,
    this.tap,
  });

  @override
  Widget build(BuildContext context) {
    var sprovider = Provider.of<ResultProvider>(context);

    return InkWell(
      onTap: () {
        sprovider.doAction(label, sign);
      },
      onLongPress: () {
        if (label == "del") {
          sprovider.adelete();
          print('delete all');
        }
      },
      focusColor: Colors.teal,
      child: Container(
        margin: EdgeInsets.only(left: 2, top: 2),
        width: w,
        height: h,
        decoration: BoxDecoration(
          color: Colors.white, //sprovider.capital ? Colors.teal :
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Card(
          elevation: 0,
          child: Center(
            child: Image.asset(
              sign,
              width: signW,
              height: signH,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
