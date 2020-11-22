import 'package:flutter/material.dart';

var currentUser = " ";
var items = ['paasta', 'pizza'];
var quantity = [2, 4];
var prices = new List<double>();
var uid = 'Ovj2ey5RS3sc1YaAmyJQ';
double total = calculateTotal();

double calculateTotal() {
  double total = 0;
  for (var i = 0; i < items.length; i++) {
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
}

class ListDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
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
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 150,
                                child: Text(
                                  items[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF3a3a3b),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: 55,
                                child: Text(
                                  (prices[index]).toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF3a3a3b),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: 30,
                                child: Text(
                                  (quantity[index]).toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF3a3a3b),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: 55,
                                child: Text(
                                  (prices[index] * quantity[index]).toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF3a3a3b),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      /*Row(
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
                      ),*/
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
