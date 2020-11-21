import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:canteen_app/global.dart';

class ShowCategory extends StatefulWidget {
  ShowCategory();
  @override
  VideoScreenState createState() => VideoScreenState();
}

int _defaultValue = 1;

class VideoScreenState extends State<ShowCategory> {
  VideoScreenState();

  void _increment() {
    if (_defaultValue <= 50) {
      setState(() {
        _defaultValue++;
      });
    }
  }

  void _decrement() {
    if (_defaultValue > 1) {
      setState(() {
        _defaultValue--;
      });
    }
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
                                      padding: EdgeInsets.all(10),
                                      child: new Center(
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Container(
                                              width: 35,
                                              height: 35,
                                              child: new FloatingActionButton(
                                                onPressed: _decrement,
                                                child: new Icon(
                                                  Icons.remove,
                                                  color: Colors.black,
                                                ),
                                                backgroundColor: Colors.white,
                                              ),
                                            ),
                                            new Text('$_defaultValue',
                                                style: new TextStyle(
                                                    fontSize: 18.0)),
                                            Container(
                                              width: 35,
                                              height: 35,
                                              child: new FloatingActionButton(
                                                onPressed: _increment,
                                                child: new Icon(Icons.add,
                                                    color: Colors.black),
                                                backgroundColor: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    new FlatButton(
                                        color: Colors.blueAccent,
                                        child: new Text(
                                          "Add",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          addToCart(
                                            document['name'],
                                            document['price'],
                                          );
                                          _defaultValue = 1;
                                          Navigator.pop(context);
                                        }),
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

void addToCart(var name, var price) {
  print(_defaultValue);
  quantity.add(int.parse(_defaultValue.toString()));
  items.add(name);
  print(price);
  prices.add(double.parse(price.toString()));
  print(quantity.length);
  print(items.length);
}
