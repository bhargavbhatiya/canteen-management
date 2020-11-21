import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:canteen_app/widgets/PopularFoodsWidget.dart';

class ShowCategory extends StatefulWidget {
  ShowCategory();
  @override
  VideoScreenState createState() => VideoScreenState();
}

class VideoScreenState extends State<ShowCategory> {
  VideoScreenState();

  int _n;

  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      _n--;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      height: 270,
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('products').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              scrollDirection: Axis.horizontal,
              children: snapshot.data.docs.map((document) {
                return Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 5, top: 5, bottom: 5),
                      decoration: BoxDecoration(boxShadow: [
                        /* BoxShadow(
                color: Color(0xFFfae3e2),
                blurRadius: 15.0,
                offset: Offset(0, 0.75),
              ),*/
                      ]),
                      child: Card(
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Center(
                          child: Image.network(
                        document['images'][0].toString(),
                        //'assets/images/popular_foods/ic_popular_food_1' +
                        // ".png",
                        width: 130,
                        height: 100,
                      )),
                    ),
                    RaisedButton(
                        child: Text("add to cart"),
                        onPressed: () {
                          showDialog(
                            context: context,
                            child: new Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Container(
                                height: 300,
                                child: new Column(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(30)),
                                    Text(
                                      "Name: " + document['name'].toString(),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Price: " + document['price'].toString(),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Quantity:",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    /*new TextField(
                                            decoration: new InputDecoration(
                                                hintText: "Quantity"),
                                            controller: q,
                                          ),*/
                                    Container(
                                      child: new Center(
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Container(
                                              width: 35,
                                              height: 35,
                                              child: new FloatingActionButton(
                                                onPressed: add,
                                                child: new Icon(
                                                  Icons.remove,
                                                  color: Colors.black,
                                                ),
                                                backgroundColor: Colors.white,
                                              ),
                                            ),
                                            new Text(_n.toString(),
                                                style: new TextStyle(
                                                    fontSize: 18.0)),
                                            Container(
                                              width: 35,
                                              height: 35,
                                              child: new FloatingActionButton(
                                                onPressed: minus,
                                                child: new Icon(Icons.add,
                                                    color: Colors.black),
                                                backgroundColor: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.only(left: 5, top: 5),
                          child: Text(document['name'],
                              style: TextStyle(
                                  color: Color(0xFF6e6e71),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.only(left: 5, top: 5, right: 5),
                          child: Text('Rs. ' + document['price'].toString(),
                              style: TextStyle(
                                  color: Color(0xFF6e6e71),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ],
                );
              }).toList(),
            );
          }),
    );
  }
}
