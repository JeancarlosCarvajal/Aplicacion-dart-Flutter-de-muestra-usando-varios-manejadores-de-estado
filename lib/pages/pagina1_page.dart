import 'package:flutter/material.dart';
import 'package:manejadores_estado_app/models/usuario.dart';
import 'package:provider/provider.dart';

import 'package:manejadores_estado_app/services/usuarios_service.dart';

class Pagina1Page extends StatelessWidget {
   
  const Pagina1Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // llamamos la instancia de provider
    final usuarioService = Provider.of<UsuariosService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text( 'Pagina 1' )),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
              // remover usuario
              usuarioService.removerUsuario();
            }
          )
        ],
      ),
      body: usuarioService.existeUsuario 
        ? InformacionUsuario(usuario: usuarioService.usuario!)
        : const Center(child: Text( 'No hay Usuarios Seleccionados' )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.keyboard_backspace_sharp),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;
  const InformacionUsuario({
    Key? key, 
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    final List<String>? profesiones = usuario.profesiones;

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
            ListTile( title: Text( 'Edad:  ${usuario.edad}' ) ),
      
            const Text( 'Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold) ),
            const Divider(),

            // esta es una forma
            if(profesiones != null) 
              ...profesiones.map((profesion) => ListTile( title: Text( 'Profesion: $profesion' ) )).toList(),

            // esta es otra forma
            if(profesiones != null) 
            ListView.builder(
              scrollDirection: Axis.vertical, 
              shrinkWrap: true,
              itemCount: profesiones.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile( 
                  title: Text( 'Profesion: ${profesiones[index]}' ) 
                );
              },
            ), 

          ],
        ),
      ),
    );
  }
}