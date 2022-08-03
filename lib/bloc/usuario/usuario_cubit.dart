import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejadores_estado_app/models/usuario.dart'; 
import 'package:meta/meta.dart'; 
part 'usuario_state.dart'; // dice que es parte del ususario_state
// recibe peticiones, cambia estado, este es el cubir como tal 

class UsuarioCubit extends Cubit<UsuarioState> {

  // cuando se llame el constructor se va mandar a llamar el UsuarioInitial la cual tiene un valor llamado existeUsuario en false
  UsuarioCubit() : super(UsuarioInitial());

  
  void seleccionarUsuario(Usuario user) {
    emit(new UsuarioActivo(user));
  }

  // nunca mutar el estado debe de hacer un nuevo estado hacer una copia nunca se debe mutar el anterior
  void cambiarEdad(int edad){
    // el state es propio del bloc
    final currenState = state;
    // verificar si estoy en el estado donde cuento con la informacion del Usuario
    if(state is UsuarioActivo){
      final newUser = (state as UsuarioActivo).usuario.copyWith(edad: edad);
      emit(UsuarioActivo(newUser));
    } 
  }

}
 