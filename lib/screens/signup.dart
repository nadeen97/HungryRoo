import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungryroo/components/background_auth.dart';
import 'package:hungryroo/screens/home.dart';
import 'package:hungryroo/screens/login.dart';

class Signup_Page extends StatefulWidget {
  @override
  _Signup_PageState createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  String userName;
  String password;
  String email;
  String checkPass;
  bool passHide=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              BackgroundAuth(),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2-30),
                child:
                Column(
                  children: <Widget>[
                    Card(
                    margin: EdgeInsets.symmetric(horizontal: 25,vertical: 4),
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        title: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'User Name'
                          ),
                          onChanged: (value)
                          {
                            userName=value;
                          },
                        )
                      ),
                    ),
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
                      margin: EdgeInsets.symmetric(horizontal: 25,vertical: 4),
                      child:ListTile(
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
                    Card(
                      margin: EdgeInsets.only(left: 25,right: 25,top: 4,bottom: 10),
                      child: ListTile(
                        leading: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        title: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm Password'
                          ),
                          obscureText: passHide,
                          onChanged: (value)
                          {
                            checkPass=value;
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
                    child: Text("LET'S START",
                      style: TextStyle(color: Colors.white,fontSize: 15),),
                    onPressed: () async {
                          if(checkPass==password)
                            {
                                try{
                                  final authResult =await _auth.createUserWithEmailAndPassword(email: email, password: password);
                                  if(authResult!=null)
                                    {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                                    }
                                }
                                catch(e){
                                   print(e);
                                }
                              }

                        }),
//                GestureDetector(child: Text("Already have an account? sign in")),

                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child:  GestureDetector(child: Text("Already have an account? sign in"),onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_page())),),
                        ),
                      ),
                    ),
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
  final FirebaseAuth _auth=FirebaseAuth.instance;

}
