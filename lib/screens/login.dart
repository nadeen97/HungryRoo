import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungryroo/components/background_auth.dart';
import 'package:hungryroo/services/auth.dart';

import 'home.dart';

class Login_page extends StatefulWidget {
  @override
  _Login_pageState createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  String email;
  String password;
  bool passHide=true;
  final FirebaseAuth _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:  Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              BackgroundAuth(),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*2/3-60),
                child:
                Column(
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 25,vertical: 4),
                      child: ListTile(
                          leading: Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          title: TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email'
                            ),
                            onChanged: (value)
                            {
                              email=value;
                            },
                          ),

                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 25,right: 25,top: 4,bottom: 20),
                      child: ListTile(
                        leading: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        title: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password'
                          ),
                          obscureText: passHide,
                          onChanged: (value)
                          {
                            password=value;
                          },

                        ),
                        trailing: IconButton(
                          color: Colors.grey,

                          icon: IconButton(icon: Icon(Icons.remove_red_eye),
                          onPressed: (){
                            setState(() {
                              passHide=!passHide;
                            });

                          },),
                        ),
                      ),
                    ),

                    MaterialButton(
                        color:Color(0xFF23d25b),
                        minWidth: MediaQuery.of(context).size.width-30,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 4),
                        child: Text("Login",
                          style: TextStyle(color: Colors.white,fontSize: 15),),
                        onPressed: () async {


     {

    try{
      var user =await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(user!=null)
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

        }
    }
    catch(e){
      print(e);
    }
  }
                        })
//                Card(color: Color(0xFF23d25b),child: ListTile(title: Text("LET'S START")),)
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
