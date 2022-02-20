import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stillfresh/firebase_database.dart';

class CreateMarketPlace extends StatefulWidget {
  const CreateMarketPlace({ Key? key }) : super(key: key);

  @override
  _CreateMarketPlaceState createState() => _CreateMarketPlaceState();
}

class _CreateMarketPlaceState extends State<CreateMarketPlace> {

  String name = ''; 
  String latitude = '';
  String longitude = ''; 
  File? image; 

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery); 

      if (image == null) return; 
      final imageTemp = File(image.path); 
      setState(() {
        this.image = imageTemp; 
      });
    } on PlatformException catch (e) {
      print('Failed to pick Image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [ 
              image != null ? Image.file(image!, width: 300, height: 300,): Image.asset('assets/images/Trashed_vegetables_in_Luxembourg.jpeg', width: 300, height: 300),
              SizedBox(height: 15.0),
              Container(
                width: 350,
                child: TextField(
                  onChanged: (val){
                    setState(() {
                       name = val; 
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Seller Place or Name",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
                  ),
              ),
              SizedBox(height: 15.0), 
              Container(
                width: 350,
                child: TextField(
                  onChanged: (val){
                    setState(() {
                       latitude = val; 
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Latitude of meeting place",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
                  ),
              ),
              SizedBox(height: 15.0,), 
              Container(
                width: 350,
                child: TextField(
                  onChanged: (val){
                    setState(() {
                       longitude = val; 
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Longitude of meeting place",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
                  ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text(
                  'Create marketplace!',
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  if (name != null && latitude != null && longitude != null) {
                    uploadImage(image!).then((value) => 
                    createMarketplace(name, latitude, longitude, value));
                    print('Data successfully added!!'); 
                  }
                },
              ),
            ],
          ),
        ),
      ), 
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          pickImage(); 
        },
        child: Icon(Icons.camera),
        tooltip: "Choose an image for your event!",
      ),
    );
  }
}