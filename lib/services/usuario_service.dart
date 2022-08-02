


import 'package:manejadores_estado_app/models/usuario.dart';

class _UsuarioService {

  Usuario? _usuario;

  Usuario? get usuario => this._usuario;

  bool get existeUsuario => (this.usuario != null) ? true : false;

  // es una manera de establecer la informacion
  void cargarUsuario ( Usuario user ) {
    this._usuario = user;
  }




}


//exportar la unica instancia de la apliacion
// esto es Teoria es un Singleton
final usuarioService = new _UsuarioService();