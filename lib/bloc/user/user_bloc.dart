import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:manejadores_estado_app/models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';


class UserBloc extends Bloc<UserEvent, UserState> {
  
  UserBloc():super(const UserInitialState()){
    on<ActiveUser>((event, emit) {
      
    });
  }


}