import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem Vindo"),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut();
                setState(() {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Login()));
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
