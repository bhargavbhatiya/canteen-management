import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowCategory extends StatefulWidget {
  ShowCategory();

  @override
  VideoScreenState createState() => VideoScreenState();
}

class VideoScreenState extends State<ShowCategory> {
  VideoScreenState();

  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('categories').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data.docs.map((document) {
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 6,
                    child: Text("Categories are: " + document['category']),
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
