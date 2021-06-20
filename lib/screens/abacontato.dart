import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/Conversa.dart';

class AbaContatos extends StatefulWidget {
  const AbaContatos({Key? key}) : super(key: key);

  @override
  _AbaContatosState createState() => _AbaContatosState();
}

class _AbaContatosState extends State<AbaContatos> {
  List<Conversa> listaConversa = [
    Conversa("Ana Clara", "Ola, como vai?",
        "https://firebasestorage.googleapis.com/v0/b/whatsappclone-e1402.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=c50688d2-05d1-46a3-b03c-09f11cdf95e8"),
    Conversa("Renato Ferraz", "Qual a boa?",
        "https://firebasestorage.googleapis.com/v0/b/whatsappclone-e1402.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=d59f35b7-1bc5-446a-8ec3-b05df4c5e3a1"),
    Conversa("Juan Cataldo", "Bora Roblox??",
        "https://firebasestorage.googleapis.com/v0/b/whatsappclone-e1402.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=f7806cf0-72e9-467e-a2b2-7a174d5cda96")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listaConversa.length,
        itemBuilder: (context, index) {
          Conversa conversa = listaConversa[index];

          return ListTile(
            contentPadding: EdgeInsets.fromLTRB(4, 8, 16, 8),
            leading: CircleAvatar(
              maxRadius: 40,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(conversa.imagepath),
            ),
            title: Text(
              conversa.nome,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          );
        });
  }
}
