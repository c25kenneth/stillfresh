import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class Maps extends StatefulWidget {
  const Maps({ Key? key }) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  static const _initialCameraPosition = CameraPosition(target: LatLng(47.62833965562269, -122.20769400792537), zoom: 11.5); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
          initialCameraPosition: _initialCameraPosition,
          ),
        ]),
      
    );
  }
}