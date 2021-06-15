import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/usuario.dart';
import 'login.dart';
import 'cadastro.dart';
import 'login.dart';


class Home extends StatefulWidget {


  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem Vindo"),
      ),
    );
  }
}
