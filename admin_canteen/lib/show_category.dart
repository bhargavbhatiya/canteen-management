import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowCategory extends StatefulWidget {
  ShowCategory();

  @override
  VideoScreenState createState() => VideoScreenState();
}

class VideoScreenState extends State<ShowCategory> {
  VideoScreenState();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('categories').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Categories",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    // height: MediaQuery.of(context).size.height,
                    child: ListView(
                      children: snapshot.data.docs.map((document) {
                        return Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          // height: MediaQuery.of(context).size.height / 2,
                          child: Container(
                            margin: EdgeInsets.all(8),
                            height: 50,
                            child: Center(
                              child: Text(
                                document['category'],
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
