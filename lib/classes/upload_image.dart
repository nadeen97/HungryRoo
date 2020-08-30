import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';



class ImageChooser extends StatefulWidget {
  @override
  _ImageChooserState createState() => _ImageChooserState();
}

class _ImageChooserState extends State<ImageChooser> {
  File imageFile;
  TextEditingController imageTitleController = new TextEditingController();
  Future<void>pickImage(ImageSource imageSource)async{
    var selectedImage=await ImagePicker.pickImage(source: imageSource);
    setState(() {
      imageFile=selectedImage;
    });
  }
  void removeImage()
  {
    setState(() {
      imageFile=null;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Photo"),),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: ()=>pickImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: ()=>pickImage(ImageSource.gallery),

            )
          ],
        ),
      ),
      body:
//      Center(
//        child: imageFile==null?Text("No Selected Image"):Image.file(imageFile),
//      )
      SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child:  imageFile==null?Text("No Selected Image"):Image.file(imageFile),
//            TextField(
//              controller: imageTitleController,
//              decoration: InputDecoration(
//                  border: InputBorder.none,
//                  hintText: getTranslated(context, "enter_image_title")
//              ),
//            )
          ),
        ),
      )
      ,
      floatingActionButton:imageFile==null? null:
      FloatingActionButton(child:
      Icon(Icons.file_upload,color: Colors.white,),
        backgroundColor: Colors.teal,
        onPressed: () async {

          Navigator.pop(context);
        },
      ),

    );
  }



}

