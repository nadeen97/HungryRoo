import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:hungryroo/components/color_logo.dart';
import 'package:hungryroo/components/home_item.dart';
import 'package:hungryroo/classes//upload_image.dart';
import 'package:hungryroo/models/restaurant.dart';
import 'package:hungryroo/screens/location.dart';
import 'package:http/http.dart'as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth=FirebaseAuth.instance;
  FirebaseUser loggedinUser;
  void getCurrtentUser()async
  {
    try{
      final user=await _auth.currentUser;
      if(user!=null)
      {
        loggedinUser=user;
      }
    }
    catch(e)
    {
      print(e);
    }

  }

  Color containerColor = Colors.transparent;
  List <Restaurant>restaurants=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:55),
              child: ColoredLogo(Colors.black),
            ),
            Container(width: 30,),
            IconButton(icon: Icon(Icons.location_on,color: Colors.black,)
            ,onPressed: () async {
                Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);


                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyLocation(currentLocation: position,)));

              },
            ),
            IconButton(icon: Icon(Icons.shopping_cart,color: Colors.black,))

          ],
        ),

      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF333030), Color(0xFF211414)])),
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  DrawerHeader(
                    margin: EdgeInsets.only(top: 50),
                    child: Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/person.jpg"),
                        radius: 70,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 180,
                      left: 180,
//            bottom: 70,
                      child: Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                            ),
                            iconSize: 30,
                            onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageChooser())),
                          ))),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20,bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                color: containerColor,
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 30,
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  onTap: () {
                    print("jj");
                    setState(() {
                      containerColor = Colors.grey;
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
//                color: containerColor,
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                  title: Text(
                    "My Account",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  onTap: () {
                    print("jj");
                    setState(() {
                      containerColor = Colors.grey;
                      Navigator.pop(context);
                    });
                  },
                ),

              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
//                color: containerColor,
                child: ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30,
                  ),
                  title: Text(
                    "Notification",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  onTap: () {
                    print("jj");
                    setState(() {
                      containerColor = Colors.grey;
                      Navigator.pop(context);
                    });
                  },
                ),

              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
//                color: containerColor,
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 30,
                  ),
                  title: Text(
                    "Settings",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  onTap: () {
                    print("jj");
                    setState(() {
                      containerColor = Colors.grey;
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
//                color: containerColor,
                child: ListTile(
                  leading: Icon(
                    Icons.help,
                    color: Colors.white,
                    size: 30,
                  ),
                  title: Text(
                    "Help",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  onTap: () {
                    print("jj");
                    setState(() {
                      containerColor = Colors.grey;
                      Navigator.pop(context);
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: restaurants.length,
          itemBuilder: (BuildContext context, int index) {
            return HomeItem(currentRest: restaurants[index],);
          }
      )
    );
  }


  @override
  void initState() {
    getCurrtentUser();
    fetchData();
  }

  fetchData()async
  {
    final String url="https://staging.furfrnz.com/api/details";
    Response  response;
    response= await http.get(url);
    if(response.statusCode==200) {
      var bodyResponse = json.decode(response.body);
      for (int i = 0; i < bodyResponse.length; i++) {
        var restaurant = bodyResponse[i];
        setState(() {
          restaurants.add(
            Restaurant.fromJson(restaurant)
          );
        });

      }
//      print(restaurants[0].resAdress);
    }
    else{
      throw Exception("Faild to load Data");
    }


  }



}
