import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'cadastro.dart';
import 'login.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //
  // FirebaseFirestore.instance.collection("usuarios").doc("001").set({"nome": "Joao"});


  runApp(MaterialApp(
    home: Login(),
    theme: ThemeData(
      primaryColor: Color(0xff075E54),
      accentColor: Color(0xff25D366)
    ),

    debugShowCheckedModeBanner: false,
  ));
}
