import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hungryroo/components/color_logo.dart';
import 'package:location/location.dart';

class MyLocation extends StatefulWidget {
  Position currentLocation;
  MyLocation({this.currentLocation});
  @override
  _MyLocationState createState() => _MyLocationState(this.currentLocation);
}

class _MyLocationState extends State<MyLocation> {
  Position currentLocation;

  @override
  void initState() {
    setState(() {
      markers.add(   Marker(markerId:MarkerId("current"),position:  LatLng(currentLocation.latitude, currentLocation.longitude) )
      );
    });
  }

  _MyLocationState(this.currentLocation);
  List<Marker>markers=[
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:55),
              child: ColoredLogo(Colors.black),
            ),
            Container(width: 50,),
            Icon(Icons.location_on,color: Color(0xFFde7047),

            ),
           Container(width: 20,),
           Icon(Icons.shopping_cart,color: Colors.black,)

          ],
        ),

      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition:CameraPosition(
              target:  LatLng(currentLocation.latitude, currentLocation.longitude),
              zoom: 50.0
            ) ,
            mapType: MapType.normal,
            markers: Set.from(markers),

          )

        ],
      ),

    );
  }
}
