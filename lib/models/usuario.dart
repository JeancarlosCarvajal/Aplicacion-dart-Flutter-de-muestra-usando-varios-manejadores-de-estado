



class Usuario {

  String? nombre;
  int? edad;
  List<String> profesiones;

  Usuario({
    this.nombre,
    this.edad,
    this.profesiones = const []
  });

  // se hace en todos los casos para Eviatar MUTACIONES de ESTADO
  Usuario copyWidth({
    String? nombre,
    int? edad,
    List<String>? profesiones,
  }) => Usuario(
    nombre: nombre ?? this.nombre, // si el nombre NOO viene como argumento en el copyWidth entonces deja el que ya tiene
    edad: edad ?? this.edad,
    profesiones: profesiones ?? this.profesiones 
  );

}