import 'package:firebase_auth/firebase_auth.dart';
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
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  TextEditingController _catController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _availController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
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
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Container(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Row(
                            children: [
                              RaisedButton(
                                onPressed: () {
                                  openDialogueBox(context);
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                color: Colors.green,
                              ),
                              // IconButton(
                              //   Icons.edit,
                              //   iconSize: 20,
                              //   onPressed: openDialogueBox(context) ,
                              // ),
                              SizedBox(
                                width: 20,
                              ),
                              // IconButton(
                              //   Icons.delete,
                              //   onPressed: ,
                              //   iconSize: 20,
                              // ),
                              RaisedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                              'Are you want to delete this product?'),
                                          actions: [
                                            FlatButton(
                                              onPressed: () {
                                                submitAction(context);
                                                Navigator.pop(context);
                                              },
                                              child: Text('Submit'),
                                            ),
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Cancel'),
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                color: Colors.red,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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

  openDialogueBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit Product Details'),
            content: Container(
              height: 240,
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(hintText: 'Name'),
                  ),
                  TextField(
                    controller: _descController,
                    decoration: InputDecoration(hintText: 'Description'),
                  ),
                  TextField(
                    controller: _priceController,
                    decoration: InputDecoration(hintText: 'price'),
                  ),
                  TextField(
                    controller: _catController,
                    decoration: InputDecoration(hintText: 'category'),
                  ),
                  TextField(
                    controller: _availController,
                    decoration:
                        InputDecoration(hintText: 'Y/N for availability'),
                  ),
                ],
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  submitAction(context);
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              )
            ],
          );
        });
  }

  fetchUserInfo() async {
    // ignore: await_only_futures
    FirebaseUser getUser = await FirebaseAuth.instance.currentUser;
    // userID = getUser.uid;
  }

  submitAction(BuildContext context) {
    // updateData(_nameController.text, _descController.text,_catController.text,
    //     int.parse(_priceController.text), _availController.text,userID);
    _nameController.clear();
    _descController.clear();
    _catController.clear();
    _priceController.clear();
    _availController.clear();
  }
}

updateData(String name, String desc, String cat, int price, String avail,
    String userID) async {
  // await DatabaseManager().updateUserList(name, desc, cat, price,avail,userID);
  // fetchDatabaseList();
}
