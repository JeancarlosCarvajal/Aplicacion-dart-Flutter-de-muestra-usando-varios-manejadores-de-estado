// aqui esta el estado de la aplicacion
part of 'user_bloc.dart'; 



@immutable
abstract class UserState {
  final bool existUser;
  final User? user;

  const UserState({
    this.existUser = false, 
    this.user
  });
}

// estado inicial en null y false
class UserInitialState extends UserState {
  const UserInitialState(): super(existUser: false, user:  null);
}

// setea el estado como un nuevo usuario
class UserSetState extends UserState {
  final User newUser;
  const UserSetState(this.newUser) : super(existUser: true, user: newUser);
}