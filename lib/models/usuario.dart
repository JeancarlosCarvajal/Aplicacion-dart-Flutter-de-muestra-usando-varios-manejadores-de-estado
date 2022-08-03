



class Usuario {

  final String nombre;
  final int edad;
  final List<String>? profesiones;

  Usuario({
    required this.nombre,
    required this.edad,
    this.profesiones
  });

  Usuario copyWith({ // tenia cambiarEdad para pruebas pero es copyWith
    String? nombre,
    int? edad,
    List<String>? profesiones,
  }) =>
    // retorna nueva instancia de usuario
    // va retornar los valor que tiene el constructor o sino retorna los valores que le asigna en el metodo copiar Usuario
    Usuario(
      nombre: nombre ?? this.nombre, 
      edad: edad ?? this.edad,
      profesiones: profesiones ?? this.profesiones
    ); 

}