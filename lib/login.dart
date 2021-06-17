import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'home.dart';
import 'model/usuario.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _controlleremail = TextEditingController();
  TextEditingController _controllersenha = TextEditingController();
  String _mensagemErro = "";

  _validarCampos() {
    String email = _controlleremail.text;
    String senha = _controllersenha.text;

    Usuario usuario = Usuario();
    usuario.email = email;
    usuario.senha = senha;

    _logarUsuario(usuario);
  }

  _logarUsuario(Usuario usuario) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .signInWithEmailAndPassword(
        email: usuario.email, password: usuario.senha)
        .then((firebaseUser) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    }).catchError((error) {
      print("erro app: " + error.toString());
      setState(() {
        _mensagemErro = error.toString();
      });
    });
  }

  _verificarUsuarioLogado() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    User? usuariologado = auth.currentUser;

    if (usuariologado != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  void initState() {
    _verificarUsuarioLogado();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xff075E54)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child:
                  Image.asset("images/logo.png", width: 200, height: 150),
                ),
                TextField(
                    autofocus: true,
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
                    child: Text("Entrar",
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
                Center(
                  child: GestureDetector(
                    child: Text(
                      "Nao tem conta? Cadastre-se!",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Cadastro(),
                          ));
                    },
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
