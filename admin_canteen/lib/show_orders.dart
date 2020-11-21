import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowOrders extends StatefulWidget {
  ShowOrders();

  @override
  VideoScreenState createState() => VideoScreenState();
}

String amount;
String orderid;
String payment;
String user;
List<String> items = new List<String>();
List<int> quantity = new List<int>();

class VideoScreenState extends State<ShowOrders> {
  VideoScreenState();

  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('orders').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data.docs.map((document) {
                amount = document['amount'].toString();
                orderid = document['orderid'].toString();
                payment = document['payment'].toString();
                user = document['user'];
                items = List.from(document['items']);

                // quantity = List.from(document['quantity']);
                return Center(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 6,
                          child: Text("\nUser is : " +
                              user +
                              "\nAmount is : " +
                              amount +
                              "\nOrder id : " +
                              orderid +
                              "\nPayment : " +
                              payment +
                              "\nItems : "),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Row(children: [
                              for (int i = 0; i < items.length; i++)
                                Text(items[i] +
                                    " - " +
                                    document['quantity'][i].toString()),
                              IconButton(
                                  icon: Icon(Icons.payments),
                                  onPressed: () {
                                    _paymentTrue(document.id);
                                  }),
                              IconButton(
                                  icon: Icon(Icons.payments_outlined),
                                  onPressed: () {
                                    _paymentFalse(document.id);
                                  })
                            ])),
                      ])),
                );
              }).toList(),
            );
          }),
    );
  }

  void _paymentTrue(String id) {
    print(id);
    FirebaseFirestore.instance.collection('orders').doc(id).update({
      'payment': true,
    });
  }

  void _paymentFalse(String id) {
    FirebaseFirestore.instance.collection('orders').doc(id).update({
      'payment': false,
    });
  }
}
