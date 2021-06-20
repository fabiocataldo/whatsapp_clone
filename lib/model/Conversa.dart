

class Conversa{

  String _nome;
  String _mensagem;
  String _imagepath;

  Conversa(this._nome, this._mensagem, this._imagepath);

  String get imagepath => _imagepath;

  set imagepath(String value) {
    _imagepath = value;
  }

  String get mensagem => _mensagem;

  set mensagem(String value) {
    _mensagem = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }
}