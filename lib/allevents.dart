import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AllSales extends StatefulWidget {
  const AllSales({ Key? key }) : super(key: key);

  @override
  _AllSalesState createState() => _AllSalesState();
}

class _AllSalesState extends State<AllSales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('marketplaces').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                final document = snapshot.data?.docs[index]; 
                return SizedBox(
                  height: 100,
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage(document?['downloadURL']),radius: 25.0,),
                      title: Text(document?['name']),
                      subtitle: Text("Address: " + document?['address']),
                    ),
                  ),
                );
              });
          }
        },
      ),
    ); 
  }
}