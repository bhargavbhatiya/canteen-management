import 'package:canteen_app/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:canteen_app/pages/SignUpPage.dart';
import 'package:canteen_app/pages/FoodOrderPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//void main() async => runApp(MaterialApp(
//    debugShowCheckedModeBanner: false,
//  theme: ThemeData(fontFamily: 'Roboto', hintColor: Color(0xFFd0cece)),
//home: ShowCategory(),
//));

void main() async {
  var state = "true";
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.collection("startstop").document("ZR6zBFDKChGnlf0WRe7W").get().then((value) {
    state = value.data()['value'].toString();
    print(state);
    if (state == "true") {
      runApp(SignUpPage());
    } else {
      runApp(closed());
    }
  });
  /*if (state == "true")
    runApp(SignUpPage());
    else
      runApp(closed());*/
}

class closed extends StatefulWidget {
  @override
  _closedState createState() => _closedState();
}

class _closedState extends State<closed> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  height: 200,
                  width: 296,
                  child: Image.network(
                    'https://cdn.vox-cdn.com/thumbor/c9bipEBuVa1OnSyZN8HI_Mp2910=/0x0:1500x996/920x613/filters:focal(630x378:870x618):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/66850835/ComingAttractions_Close_6.0.jpg',
                    height: 200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
