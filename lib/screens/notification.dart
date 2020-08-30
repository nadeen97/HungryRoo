import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final FirebaseMessaging _firebaseMessaging=FirebaseMessaging();
  String messegeState="There is no notifactions yet";

  @override
  void initState() {
    configureCallbacks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          messegeState,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black54
          ),
        ),
      ),
    );
  }
  void configureCallbacks()
  {
    _firebaseMessaging.configure(
      onMessage: (message)async{

        print("on messege$message");
        setState(() {
          messegeState="on messege$message";
        });
      },
      onResume: (message)async{
        print("on Resume$message");

        setState(() {
          messegeState="on Resume$message";
        });

      },
      onBackgroundMessage: (message)async{
        print("on background$message");
        setState(() {
          messegeState="on Background$message";
        });

      },
      onLaunch: (message)async{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPage()));
        print("on Launch$message");

        setState(() {
          messegeState="on Launch$message";
        });
      },
    );
  }
}
