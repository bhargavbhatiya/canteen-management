import 'package:canteen_app/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//void main() async => runApp(MaterialApp(
//    debugShowCheckedModeBanner: false,
//  theme: ThemeData(fontFamily: 'Roboto', hintColor: Color(0xFFd0cece)),
//home: ShowCategory(),
//));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomePage());
}
