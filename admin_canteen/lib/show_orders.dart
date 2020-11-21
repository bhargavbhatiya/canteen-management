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
String _item;
//List<String> quantity = new List<int>().toString();

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

                //quantity = List.from(document['quantity']).toString();
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 6,
                    child: Text("\nUser is : " +
                        user +
                        "\nAmount is : " +
                        amount +
                        "\nOrder id : " +
                        orderid +
                        "\nPayment : " +
                        payment),
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}