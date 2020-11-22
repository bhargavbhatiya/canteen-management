import 'dart:ffi';
//import 'dart:html';

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
String datetime;
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
                if (payment == 'true') payment = 'Done';
                if (payment == 'false') payment = 'Pending';
                user = document['user'];
                items = List.from(document['items']);

                datetime =
                    DateTime.parse(document['datetime'].toDate().toString())
                        .toString();

                // quantity = List.from(document['quantity']);
                return Center(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
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
                              "\nDate-Time : " +
                              datetime +
                              "\nItems - Quantity"),
                        ),
                        if (document['status'] == 'a')
                          Text('\nOrdered and waiting for confitmation.\n')
                        else if (document['status'] == 'b')
                          Text('\nOrdered rejected!')
                        else if (document['status'] == 'c')
                          Text('\nFood Ready')
                        else
                          Text('\nStatus not available'),
                        Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(children: [
                              for (int i = 0; i < items.length; i++)
                                Text(items[i] +
                                    " - " +
                                    document['quantity'][i].toString()),
                              IconButton(
                                  icon: Icon(
                                    Icons.payments,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {
                                    _paymentTrue(document.id);
                                  }),
                              IconButton(
                                  icon: Icon(Icons.payments_outlined),
                                  color: Colors.red,
                                  onPressed: () {
                                    _paymentFalse(document.id);
                                  }),
                              IconButton(
                                  icon: Icon(
                                    Icons.circle,
                                    color: Colors.black12,
                                  ),
                                  onPressed: () {
                                    _changeStatusToA(document.id);
                                  }),
                              IconButton(
                                  icon: Icon(
                                    Icons.circle,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    _changeStatusToB(document.id);
                                  }),
                              IconButton(
                                  icon: Icon(
                                    Icons.circle,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {
                                    _changeStatusToC(document.id);
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

  void _changeStatusToA(String id) {
    FirebaseFirestore.instance.collection('orders').doc(id).update({
      'status': 'a',
    });
  }

  void _changeStatusToB(String id) {
    FirebaseFirestore.instance.collection('orders').doc(id).update({
      'status': 'b',
    });
  }

  void _changeStatusToC(String id) {
    FirebaseFirestore.instance.collection('orders').doc(id).update({
      'status': 'c',
    });
  }
}
