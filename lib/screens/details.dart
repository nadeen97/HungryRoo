import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungryroo/components/color_logo.dart';
import 'package:hungryroo/classes//image_viewer.dart';
import 'package:hungryroo/models/restaurant.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RestuarantDetails extends StatelessWidget {
  Restaurant currentRest;
  RestuarantDetails(this.currentRest);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RestaurantAppBar(restaurant: currentRest,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
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
                      spacing: 0.0),
                  Text(" (351)",style: TextStyle(color: Colors.grey,fontSize: 15),)
                ],

              ),
              SizedBox(height: 10),

              Text(
                "Open Hour",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,

                ),
              ),
              SizedBox(height: 10),

              Image.asset(currentRest.resOpenHour,width: MediaQuery.of(context).size.width,),
              SizedBox(height: 10),
              Text(
                "Location",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,

                ),
              ),
              SizedBox(height: 10),

              Image.asset(currentRest.resLocation,width: MediaQuery.of(context).size.width,),
              SizedBox(height: 10),
              Text(
                "Gallary",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,

                ),
              ),
              SizedBox(
                height: 200,
                child: GridView.count(
                    crossAxisCount: 2,


                  children:List.generate(currentRest.resAlbum.length, (index)
                  {

                    return
                      Card(

                          elevation: 10.0,
                          child:GestureDetector(child: Image.asset(currentRest.resAlbum[index],width: 50,height: 50,fit: BoxFit.cover,
                          ),onTap: ()=>      Navigator.push(context, MaterialPageRoute(builder: (context) => ImageViewer(currentRest.resAlbum[index],),))
                            ,)
                          );


                  })
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class RestaurantAppBar extends PreferredSize {
  Restaurant restaurant;
  RestaurantAppBar({@required this.restaurant});

  @override
  Size get preferredSize => Size.fromHeight(300);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(restaurant.resCover),
            fit: BoxFit.cover,
          )),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: <Widget>[
              FlatButton(
                onPressed: () =>Navigator.pop(context),
                child: new Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30.0,
                ),
                shape: new CircleBorder(),
                color: Colors.black.withOpacity(0.4),


              ),

              Padding(
                padding: const EdgeInsets.only(left: 40.0,right: 30),
                child: ColoredLogo(Color(0xFFFFFFFF)),
              ),
              Container(

                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    border: Border.all(color: Colors.black, width: 0.0),
                    borderRadius:
                    new BorderRadius.all(Radius.elliptical(90,45)),
                  ),

                child: Row(
                  children: <Widget>[
                    Text("\$0.00 ",style: TextStyle(color: Colors.white,fontSize: 20),),
                    Container(
                      decoration: BoxDecoration(
//                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(40.0))
                       ),

                        child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 25.0,
                      ),
                      width: 40,
                        height: 40,
                    ),
                  ],

                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 130,bottom: 0,left: 20),
          child: Image.asset(
            restaurant.resLogo,
            width: 80,
            height: 80,
          ),
        ),
      ],
    );
  }
}
