import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:manejadores_estado_app/models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';


class UserBloc extends Bloc<UserEvent, UserState> {
  
  UserBloc():super(const UserInitialState()){
    // el event contiene la informacion proveniente de ActivateUserEvent(event)
    // on<> esta escuchando el evento para disparar el UserSetState(event.user)
    on<ActivateUserEvent>( (event, emit) => emit( UserSetState(event.user) ) );

    // Volver la aplicacion al estado inicial
    on<DeleUserEvent>( (event, emit) => emit(const UserInitialState()) );

    on<ChangeUserAgeEvent>((event, emit) {
      // al exterderlo del Bloc tengo acceso al state
      // si el ususario no esta establecido no puedo cambiar la edad por lo tanto no hagas nada
      // print('CgangeUserAgeEvent called'); 
      if(!state.existUser) return;
      // NUNCA se debe MUTAR el estado se debe procurar crear un nuevo estado
      // OJO NO MUTAR ESTADO
      // el state.user hace referencia a lo Indicado en user_state.dart el cual contiene un objeto llamado User que contiene user.copyWidth()
      emit( UserSetState( state.user!.copyWidth(edad: event.age) ) );
      print('Se va emitir un nuevo estado Aqui');

    });

    on<ChangeProfesionEvent>((event, emit) {
      if(!state.existUser) return;

      // Una forma de hacerlo
      // final List<String>? profesiones = state.user!.profesiones;
      // profesiones!.add( 'Profesion ${event.profesion}: ${profesiones.length+1}' );

      // otra forma de hacerlo.. se debe colocar ...? y el ! para trbajar con el posible null
      // final newArray = [...ArrayViejo, AddToArrayViejo];
      final profesiones = [...?state.user!.profesiones, 'Profesion ${event.profesion}: ${state.user!.profesiones!.length + 1 }'];

      emit( UserSetState( state.user!.copyWidth(profesiones: profesiones) ) );
    });


  }


}