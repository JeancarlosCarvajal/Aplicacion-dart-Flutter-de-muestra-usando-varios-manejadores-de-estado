



import 'package:flutter/cupertino.dart';
import 'package:manejadores_estado_app/models/usuario.dart';

class UsuariosService extends ChangeNotifier {

  Usuario? _usuario;

  Usuario? get usuario => this.  _usuario;

  bool get existeUsuario => this._usuario != null ? true : false;


  set setUsuario(Usuario user){
    this._usuario = user;
    notifyListeners();
  }

  //cambiar edad
  void cambiarEdad(int edad){
    if(this._usuario != null) {
      this._usuario?.edad = edad;
      notifyListeners();
    }
  }

  // remover el usuario
  void removerUsuario(){
    this._usuario = null;
    notifyListeners();
  }

  // agregar profesion
  void agregarProfesion(){
    if(this._usuario != null) {
      this._usuario?.profesiones!.add('Profesion: ${ this._usuario!.profesiones!.length + 1 }');
      notifyListeners();
    }
  }
 

}