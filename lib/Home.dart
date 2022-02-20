import 'dart:async';

import 'package:stillfresh/allevents.dart';
import 'package:stillfresh/firebaseauth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stillfresh/createmarketplace.dart';
import 'package:stillfresh/firebaseauth.dart';
import 'package:stillfresh/main.dart';
import 'package:stillfresh/photoGallery.dart';
import 'allevents.dart';
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0; 
  final tabs = [
    AllSales(), 
    PhotoGallery(),
    CreateMarketPlace(),
  ];
  final Completer<GoogleMapController> _mapController = Completer(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), centerTitle:true, actions:[
        MaterialButton(
          child: Text('Sign Out!'),
          onPressed: (){
          SignOut(); 
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
        })
      ],),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'All Sales'),
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'Album'),
          BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Create Marketplace')
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index; 
          });
        },
      ),
    );
  }
}