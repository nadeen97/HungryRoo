import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColoredLogo extends StatelessWidget {
  ColoredLogo(this.color);
  Color color;
  bool isWhite;

  @override
  Widget build(BuildContext context) {
    return
    color==Color(0xFFFFFFFF)?
    Row(
      children: <Widget>[
        Text(
          "HungryRoo ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
              fontWeight: FontWeight.bold

          ),

        ),
        Image.asset("assets/logo.png",width: 30,height: 30,)
      ],
    ):
    Row(
      children: <Widget>[
        Text(
          "HungryRoo ",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            fontWeight: FontWeight.bold
          ),

        ),
        Image.asset("assets/logo2.png",width: 30,height: 30,)
      ],
    );


  }
}
