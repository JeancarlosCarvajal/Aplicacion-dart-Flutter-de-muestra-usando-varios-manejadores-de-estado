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
  }


}