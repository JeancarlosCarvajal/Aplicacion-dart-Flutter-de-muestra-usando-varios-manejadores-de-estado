part of 'usuario_cubit.dart'; // dice que es parte del ususario_state


// Aqui van los estados que el cubit va manejar

// el immutable me va importar cupertino o material pero no lo necesito por lo tanto
// importo solo /meta/meta.dart que solo tiene los tags
/// A class is immutable if all of the instance fields of the class, whether
/// defined directly or inherited, are `final`.
@immutable // clase abstaracta no se quiere que cambie por lo tanto immutable
abstract class UsuarioState  { // UsuarioState es el padre que debe ser colocado en el Cubit como tipo de valor a manejar <UsuarioState>
  
}


// declara el estado inicial
// se tiene las propiedades iniciales del usuario
// Obviamente aqui no hay un Usuario creado
class UsuarioInitial extends UsuarioState {

  final existeUsuario = false;

  // @override
  // String toString() { // esto es para pruebas
  //   return 'UsuarioInitial: existeUsuario: false';
  // }

}


// ver que ya tenemos un auario activo y deberia estar en true
class UsuarioActivo extends UsuarioState {
  final existeUsuario = true;
  final Usuario usuario;

  UsuarioActivo(this.usuario);

}