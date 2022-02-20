import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
Future createMarketplace(String name, String latitude, String longitude, String downloadURL) async {
  try {
    CollectionReference marketplaces = FirebaseFirestore.instance.collection('marketplaces'); 
    await marketplaces.add({
        'name' : name, 
        'latitude' : latitude, 
        'longitude' : longitude, 
        'downloadURL' : downloadURL, 
      });
  } catch (e) {
    print(e.toString()); 
  }
}

Future createMarketplaceTest(String name, String latitude, String longitude) async {
  try {
    CollectionReference marketplaces = FirebaseFirestore.instance.collection('marketplaces'); 
    await marketplaces.add({
        'name' : name, 
        'latitude' : latitude, 
        'longitude' : longitude, 
      });
  } catch (e) {
    print(e.toString()); 
  }
}

Future<String> uploadImage(File image) async {
  try {
    String name = DateTime.now().toString();
    await FirebaseStorage.instance.ref('$name.png').putFile(image); 
    String url = await FirebaseStorage.instance.ref('$name.png').getDownloadURL(); 

    return url.toString();
  } catch (e) {
    print(e.toString());
    return ''; 
  }
 
}