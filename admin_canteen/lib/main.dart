import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:admin_canteen/admin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Admin(),
  ));
}
