


import 'dart:async';

import 'package:manejadores_estado_app/models/usuario.dart';

class _UsuarioService {

  Usuario? _usuario;

  // creamos el stream controller para poder acceder a el en el StreamBuilder y redibujar el widget
  // habla con un solo widget a la vez, para que sea a todos debes agregarle broadcast() al final
  final StreamController<Usuario> _usuarioStreamController = new StreamController<Usuario>.broadcast(); // tenia new

  Usuario? get usuario => this._usuario;

  bool get existeUsuario => (this.usuario != null) ? true : false;

  // hacer un stream para redibujar el widget
  // para acceder a este stream controller debo envolver el widget que quiero redibujar en un StreamBuilder
  // este es el stream: del streambuilder
  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;


  // es una manera de establecer la informacion
  void cargarUsuario ( Usuario user ) {
    this._usuario = user;

    // aqui anadimos un nuevo elemento al stream para manejar el estado
    // esto me va llenar de informacion el snapshot.hasData por lo tanto se va correr la condicion en el streamBuilder
    this._usuarioStreamController.add(user);
  }

  // metodo que cambia le edad del usuario
  void cambiarEdad( int edad ) {
    if(this._usuario != null) {
      this._usuario!.edad = edad;
      this._usuarioStreamController.add(_usuario!); 
    }
  }

  // ahora limpiamos el stream controller para que no halla fuga de memoria
  dispose(){
    this._usuarioStreamController.close();
  }


}


//exportar la unica instancia de la apliacion
// esto es Teoria es un Singleton
final usuarioService = new _UsuarioService();