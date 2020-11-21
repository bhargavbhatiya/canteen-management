import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowProduct extends StatefulWidget {
  ShowProduct();

  @override
  VideoScreenState createState() => VideoScreenState();
}

String mrp;
Image m;

class VideoScreenState extends State<ShowProduct> {
  VideoScreenState();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(children: <Widget>[
        Expanded(
            child: FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.update,
                ),
                label: Text('Update Products')))
      ])),
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
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 6,
                    child: Text("\nName : " +
                        document['name'] +
                        '\n' +
                        "Description : " +
                        document['description'] +
                        "\nProduct category : " +
                        document['category'] +
                        "\nPrice is : " +
                        mrp +
                        '\n' +
                        "Availaible : " +
                        document['available'] +
                        '\n'),
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
