class Usuario {

  late String _name;
  late String _email;
  late String _senha;

  Usuario();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "nome": this.nome,
      "email": this.email
    };
    return map;
}

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get nome => _name;

  set nome(String value) {
    _name = value;
  }
}