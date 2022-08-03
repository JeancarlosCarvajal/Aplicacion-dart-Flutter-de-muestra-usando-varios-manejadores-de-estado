part of 'user_bloc.dart'; 


// abstract es para saber que tipo de enveto voy a recibir en mi clase
// clase immutable que sirve para crear eventos del tipo Event
@immutable
abstract class UserEvent {}


class ActivateUserEvent extends UserEvent {
  final User user;

  // son {} es posicional
  ActivateUserEvent(this.user);

}