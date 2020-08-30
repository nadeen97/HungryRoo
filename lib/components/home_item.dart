import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungryroo/models/restaurant.dart';
import 'package:hungryroo/screens/details.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomeItem extends StatelessWidget {
  HomeItem({@required this.currentRest });
  Restaurant currentRest;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.network(
                currentRest.resImage,
                width: 160,
                height: 160,
              ),
              SmoothStarRating(
                  allowHalfRating: false,
                  onRated: (v) {},
                  starCount: 5,
                  rating: 4,
                  size: 20.0,
                  isReadOnly: true,
//                  filledIconData: Icons.blur_off,
//                  halfFilledIconData: Icons.blur_on,
                  color: Colors.green,
                  borderColor: Colors.green,
                  spacing: 0.0)
            ],
          ),
          Expanded(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(

                          currentRest.resNAme,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,

                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.keyboard_arrow_right,color: Colors.grey)
                      ,onPressed:(){
                            print("pressed");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RestuarantDetails(currentRest)));})
                    ],
                  )
                  ,
                  Padding(
                    padding: const EdgeInsets.only(bottom:5 ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.restaurant,
                          color: Colors.grey,
                          size: 15,
                        ),
                        Text(" ${currentRest.resType}",
                          style: TextStyle(fontSize: 15,color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: 15,
                        ),
                        Expanded(
                          child: Text(" ${currentRest.resAdress}",
                            style: TextStyle(fontSize: 15,color: Colors.grey),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  )
                 ,
                  Text("Min Order \$${currentRest.resMinOrede}",style: TextStyle(fontSize: 15,color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                          border: Border.all(
                            color:Color(0xFFde7047),
                            width: 2.0
                          ),
                            borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("any thing",
                            style: TextStyle(color: Color(0xFFde7047),fontWeight: FontWeight.bold,fontSize: 15),),
                          ),
                        ),
                        Container(width: 6,),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:Color(0xFFde7047),
                                  width: 2.0
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("hh",
                              style: TextStyle(color: Color(0xFFde7047),fontWeight: FontWeight.bold,fontSize: 15),),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
//Column(
//  mainAxisAlignment: MainAxisAlignment.start,
//  crossAxisAlignment: CrossAxisAlignment.start,
//  children: <Widget>[
//
//  ],
//)
        ],
      ),
    );
  }
}
