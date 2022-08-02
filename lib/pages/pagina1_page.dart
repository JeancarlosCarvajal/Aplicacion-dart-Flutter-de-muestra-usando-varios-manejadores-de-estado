import 'package:flutter/material.dart';
import 'package:manejadores_estado_app/models/usuario.dart';
import 'package:manejadores_estado_app/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
   
  const Pagina1Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text( 'Pagina 1' )),
      ),
      body: StreamBuilder( // Short Cut de flutter:        StreamBldr
        stream: usuarioService.usuarioStream, 
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          // snapshot es el que almacena la informacion, por lo tanto si existe es que tenemos un usuario
          // la informacion del streambuilder esta dentro de snapshot.data tambien es la misma que usuarioService.usuario
          // ya que lo asigamos de esa forma cuando creamos el streambuilder en usuario_service.dart
          // este streambuilder Redibuja el Widget
          return snapshot.hasData
              ? InformacionUsuario( usuario: snapshot.data! ) // en teoria aqui sii tenemos un usuario registrado, tambien es lo mismo que snapshot.data = usuarioService.usuario
              : const Center( child: Text( 'No hay Informacion del Usuario' ) );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.keyboard_backspace_sharp),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  // recibimos el usuario rgistrado. Siempre va existir
  final Usuario usuario;
  const InformacionUsuario({
    Key? key, 
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print("Profesiones: ${usuario.profesiones}");
    
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(), // BouncingScrollPhysics
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text( 'General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold) ),
            // ignore: prefer_const_constructors
            Divider(),
      
            ListTile( title: Text( 'Nombre: ${usuario.nombre}' ) ),
            ListTile( title: Text( 'Edad: ${usuario.edad}' ) ),
      
            const Text( 'Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold) ),
            const Divider(),
      
            ListTile( title: Text( 'Profesion 1: ' ) ),
            ListTile( title: Text( 'Profesion 1: ' ) ),
            ListTile( title: Text( 'Profesion 1: ' ) ),

          ],
        ),
      ),
    );
  }
}