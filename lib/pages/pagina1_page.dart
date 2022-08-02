import 'package:flutter/material.dart';
import 'package:manejadores_estado_app/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
   
  const Pagina1Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text( 'Pagina 1' )),
      ),
      body: usuarioService.existeUsuario
      ? InformacionUsuario()
      : const Center( child: Text( 'No hay Informacion del Usuario' ) ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.keyboard_backspace_sharp),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({
    Key? key,
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

            Text( 'General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold) ),
            Divider(),
      
            ListTile( title: Text( 'Nombre: ' ) ),
            ListTile( title: Text( 'Edad: ' ) ),
      
            Text( 'Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold) ),
            Divider(),
      
            ListTile( title: Text( 'Profesion 1: ' ) ),
            ListTile( title: Text( 'Profesion 1: ' ) ),
            ListTile( title: Text( 'Profesion 1: ' ) ),

          ],
        ),
      ),
    );
  }
}