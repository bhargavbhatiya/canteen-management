// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowReport extends StatefulWidget {
  ShowReport();

  @override
  VideoScreenState createState() => VideoScreenState();
}

double amount = 0;
int totalOrder = 0;
String amt;
String ttl;
String orderid;
String payment;
String user;
String datetime;
List<String> items = new List<String>();
List<int> quantity = new List<int>();

class VideoScreenState extends State<ShowReport> {
  VideoScreenState();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('orders').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  amount = 0;
                  totalOrder = 0;
                  return SizedBox(
                    height: 100,
                    width: 0,
                    child: ListView(
                      children: snapshot.data.docs.map((document) {
                        if (document['payment']) {
                          amount += document['amount'];
                          totalOrder += 1;
                        }
                        //print(totalOrder);
                        amt = amount.toString();
                        ttl = totalOrder.toString();
                        datetime = DateTime.parse(
                                document['datetime'].toDate().toString())
                            .toString();

                        // quantity = List.from(document['quantity']);
                      }).toList(),
                    ),
                  );
                }),
            Text("\nDate : " +
                datetime +
                "\nTotal Revenue : " +
                amt +
                "\nTotal Orders : " +
                ttl)
          ],
        ),
      ),
    );
  }
}
