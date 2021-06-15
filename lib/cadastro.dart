import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';
import 'model/usuario.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  TextEditingController _controllername = TextEditingController();
  TextEditingController _controlleremail = TextEditingController();
  TextEditingController _controllersenha = TextEditingController();
  String _mensagemErro = "";

  _validarCampos() {
    String name = _controllername.text;
    String email = _controlleremail.text;
    String senha = _controllersenha.text;

    if (name.isNotEmpty) {
      if (email.isNotEmpty && email.contains("@")) {
        if (senha.isNotEmpty) {
          setState(() {
            _mensagemErro = "";
          });

          Usuario usuario = Usuario();
          usuario.nome = name;
          usuario.email = email;
          usuario.senha = senha;

          _cadastrarUsuario(usuario);
        } else
          setState(() {
            _mensagemErro = "Preencha sua senha";
          });
      } else
        setState(() {
          _mensagemErro = "Preencha com um Email valido";
        });
    } else
      setState(() {
        _mensagemErro = "Preencha seu nome";
      });
  }

  _cadastrarUsuario(Usuario usuario) async {

    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .createUserWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((firebaseUser){


          FirebaseFirestore db = FirebaseFirestore.instance;


          db.collection("usuarios").doc(auth.currentUser!.uid).set(usuario.toMap());


          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));

            })
        .catchError((error) {
          print("erro app: " + error.toString());
      setState(() {
        _mensagemErro =
            "Usuario nao cadastrado, verifique os dados e tentenovamente";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xff075E54)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset("images/usuario.png",
                      width: 200, height: 150),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: TextField(
                      controller: _controllername,
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Nome",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32)))),
                ),
                TextField(
                    controller: _controlleremail,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Email",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)))),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: TextField(
                      controller: _controllersenha,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Password",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32)))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _validarCampos();
                    },
                    child: Text("Cadastrar",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ))),
                  ),
                ),
                Text(
                  _mensagemErro,
                  style: TextStyle(color: Colors.red, fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
