



import 'package:get/get.dart';
import 'package:manejadores_estado_app/models/usuario.dart';

class UsuarioController extends GetxController {

  // Puede ser transformado en un obserbable obs el cual va operar como si fuese un booleano
  var existeUsuario = false.obs;
  // Puede ser transformado en un obserbable obs el cual va operar como si fuese un Usuario
  var usuario = new Usuario().obs;

  // cantidad de profesiones del usuario
  int get profesionesCount {
    return this.usuario.value.profesiones.length;
  }

  void cargarUsuario(Usuario usuario){
    this.existeUsuario.value = true;
    this.usuario.value = usuario;
  }

  void cambiarEdad(int edad){
    // en vez de usar un copyWith el Getz tiene su propia forma de revalorizar la propiedad sin Mutarla
    // update() es gracias al obs
    this.usuario.update((val) {
      val!.edad = edad;
    });
  }

  void agregarProfesion(String profesion) {
    // update() es gracias al obs
    this.usuario.update((val) {
      // agarramos el array de profesiones actual y le agregamos la profesion nueva
      // val tiene el valor del usuario actualmente
      val!.profesiones = [...val.profesiones, profesion];
    });
  }


}