import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:manejadores_estado_app/controllers/usuario_controller.dart';
import 'package:manejadores_estado_app/models/usuario.dart';

// import 'package:manejadores_estado_app/pages/pagina2_page.dart'; // se esta usando con las prubas de Getx

class Pagina1Page extends StatelessWidget {
   
  const Pagina1Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    // eleva al usuarioController al context que es manejado por el getx
    final usuarioCtrl = Get.put( UsuarioController() ); 

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text( 'Pagina 1' )),
      ),
      body: Obx( // cada vez que cambie algo en el controlador se me va activar el Obx redibujando el widget
        () => usuarioCtrl.existeUsuario.value 
          ? InformacionUsuario( usuario: usuarioCtrl.usuario.value )
          : const NoInfo()
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.keyboard_backspace_sharp),
        // onPressed: () => Get.to(const Pagina2Page()), // usando Getx
        onPressed: () => Get.toNamed('pagina2', arguments: { // usando Getx otra forma, se puede mandar argumentos tambien
          'nombre': 'Jeancarlos',
          'edad': 37
        }), 
        // onPressed: () => Navigator.pushNamed(context, 'pagina2'), // usando la navegacion normal
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text( 'No hay Usuario Seleccionado' ),
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

            if(usuario.profesiones.isNotEmpty)
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: usuario.profesiones.length,
              itemBuilder: (_, int index) {
                return ListTile( title: Text( 'Profesion ${index+1}: ${usuario.profesiones[index]}' ) ); 
              },
            )

            // ListTile( title: Text( 'Profesion 1: ' ) ),
            // ListTile( title: Text( 'Profesion 1: ' ) ),
            // ListTile( title: Text( 'Profesion 1: ' ) ),

          ],
        ),
      ),
    );
  }
}