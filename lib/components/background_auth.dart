import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  //                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.grey[100]])),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        child: Image.asset(
                          "assets/logo.png",
                          width: 70,
                          height: 70,
                        ),
                        padding: EdgeInsets.only(top: 50),
                      ),
                      Text(
                        "HungryRoo",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}
