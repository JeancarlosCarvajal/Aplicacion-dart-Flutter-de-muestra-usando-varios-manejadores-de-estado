part of 'user_bloc.dart'; 

// entre estados y los envetos no hay una relacion directa el que hace la interaccion es el bloc

// abstract es para saber que tipo de enveto voy a recibir en mi clase
// clase immutable que sirve para crear eventos del tipo Event
@immutable
abstract class UserEvent {}


class ActivateUserEvent extends UserEvent {
  final User user;
  // son {} es posicional
  ActivateUserEvent(this.user);
}

// entre estados y los envetos no hay una relacion directa el que hace la interaccion es el bloc
class ChangeUserAgeEvent extends UserEvent {
  final int age;
  ChangeUserAgeEvent(this.age);
}

class ChangeProfesionEvent extends UserEvent {
  final String profesion;
  ChangeProfesionEvent(this.profesion);
}

// no mando nada porque no va recibir nada de parametros
class DeleUserEvent extends UserEvent {}