



class User {

  String nombre;
  int edad;
  List<String>? profesiones;

  User({
    required this.nombre,
    required this.edad,
    this.profesiones
  });

  // se hace en todos los casos para Eviatar MUTACIONES de ESTADO
  User copyWidth({
    String? nombre,
    int? edad,
    List<String>? profesiones,
  }) => User(
    nombre: nombre ?? this.nombre, // si el nombre NOO viene como argumento en el copyWidth entonces deja el que ya tiene
    edad: edad ?? this.edad,
    profesiones: profesiones ?? this.profesiones 
  );

}