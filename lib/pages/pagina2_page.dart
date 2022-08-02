import 'package:flutter/material.dart';
import 'package:manejadores_estado_app/models/usuario.dart';
import 'package:provider/provider.dart'; 

import 'package:manejadores_estado_app/services/usuarios_service.dart';

class Pagina2Page extends StatelessWidget {
   
  const Pagina2Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final usuariosService = Provider.of<UsuariosService>(context);
    return  Scaffold(
      appBar: AppBar(
        title: usuariosService.existeUsuario
        ? Center(child: Text( 'Nombre: ${usuariosService.usuario!.nombre}' ))
        : const Center(child: Text( 'Pagina 2' )),
      ),
      body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                final newUser = new Usuario(
                  nombre: 'Jeancarlos', 
                  edad: 37,
                  profesiones: ['Full Stack Developer', 'Video Jugador', 'Ingeniero']
                );
                usuariosService.setUsuario = newUser;
              },
              child: const Text( 'Establecer Usuario', style: TextStyle(color: Colors.white) )
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                //cambiar la edad
                usuariosService.cambiarEdad(25);
              },
              child: const Text( 'Cambiar Edad', style: TextStyle(color: Colors.white) )
            ),MaterialButton(
              color: Colors.blue,
              onPressed: (){
                usuariosService.agregarProfesion();
              },
              child: const Text( 'Anadir Profesion', style: TextStyle(color: Colors.white) )
            ),

          ],
         ),
      ),
    );
  }
}