import 'package:flutter/material.dart';
import 'package:manejadores_estado_app/models/usuario.dart';
import 'package:manejadores_estado_app/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
   
  const Pagina2Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text( 'Pagina 2' ),
      ),
      body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                final nuevoUsuario = new Usuario(nombre: 'Jeancarlos', edad: 37);
                usuarioService.cargarUsuario(nuevoUsuario);
              },
              child: const Text( 'Establecer Usuario', style: TextStyle(color: Colors.white) )
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                usuarioService.cambiarEdad(25);
              },
              child: const Text( 'Cambiar Edad', style: TextStyle(color: Colors.white) )
            ),MaterialButton(
              color: Colors.blue,
              onPressed: (){

              },
              child: const Text( 'Anadir Profesion', style: TextStyle(color: Colors.white) )
            ),

          ],
         ),
      ),
    );
  }
}