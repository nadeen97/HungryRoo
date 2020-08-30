class Restaurant
{
  String resNAme;
  String resImage;
  String resAdress;
  String resType="Pizza";
  int resMinOrede=30;
  int resRate=4;
  String resLogo="assets/reslog.png";
  String resCover="assets/food.jpg";
  String resOpenHour="assets/hours.png";
  String resLocation="assets/location.png";
  List<String>resAlbum=["assets/album/alb1.jpg","assets/album/alb2.jpg","assets/album/alb3.jpg","assets/album/alb4.jpg","assets/album/alb5.jpg","assets/album/alb6.jpg"];
  //galalray album


  Restaurant({this.resAdress,this.resImage,this.resNAme});


  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      resNAme: json['name'],
      resImage: json['image'],
      resAdress: json['address'],
    );
  }

}
