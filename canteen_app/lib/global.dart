import 'package:flutter/material.dart';

var currentUser = " ";
var items = new List();
var quantity = new List<int>();
var prices = new List<int>();
var uid;
int total = calculateTotal();

int calculateTotal(){
  int total = 0;
  for (var i = 0; i < items.length; i++){
    total += quantity[i] * prices[i];
  }
  print(total);
  return total;
}

var orders = 1;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      home: new ListDisplay(),
    );
  }
}class ListDisplay extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        body: ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                                      return Container(
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        height: 70,
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFFfae3e2).withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(0, 1),
                                          ),
                                        ]),
                                        child: Card(
                                          color: Colors.white,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(5.0),
                                            ),
                                          ),
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.only(left: 25, right: 30, top: 10, bottom: 10),
                                            child: Column(
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      items[index],
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Color(0xFF3a3a3b),
                                                          fontWeight: FontWeight.w600),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    Text(
                                                        (prices[index]).toString(),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Color(0xFF3a3a3b),
                                                          fontWeight: FontWeight.w600),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    Text(
                                                      (quantity[index]).toString(),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Color(0xFF3a3a3b),
                                                          fontWeight: FontWeight.w600),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    Text(
                                                      (prices[index] * quantity[index]).toString(),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Color(0xFF3a3a3b),
                                                          fontWeight: FontWeight.w600),
                                                      textAlign: TextAlign.left,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                     }
    ),
        );
  }
}