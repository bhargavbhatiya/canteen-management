import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowProduct extends StatefulWidget {
  ShowProduct();

  @override
  VideoScreenState createState() => VideoScreenState();
}

String mrp;
String name;
String description;
String available;
String category;
String id;

class VideoScreenState extends State<ShowProduct> {
  VideoScreenState();

  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('products').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data.docs.map((document) {
                mrp = document['price'].toString();
                name = document['name'];
                description = document['description'];
                category = document['category'];
                available = document['available'];
                id = document['id'].toString();
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 6,
                    child: Text("\nName : " +
                        name +
                        '\n' +
                        "Description : " +
                        description +
                        "\nProduct category : " +
                        category +
                        "\nPrice is : " +
                        mrp +
                        '\n' +
                        "Availaible : " +
                        available +
                        '\n'),
                  ),
                );
              }).toList(),
            );
          }),
    );
  }

  void _changeAvailability(String id, String available) {
    try {
      String ava;
      if (available == 'Y') {
        ava = 'N';
      } else {
        ava = 'Y';
      }
      FirebaseFirestore.instance
          .collection('products')
          .doc(id)
          .update({'available': ava});
    } catch (e) {
      print(e.toString());
    }
  }
}
