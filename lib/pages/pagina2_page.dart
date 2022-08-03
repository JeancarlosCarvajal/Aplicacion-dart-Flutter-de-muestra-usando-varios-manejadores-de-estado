import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:manejadores_estado_app/bloc/usuario/usuario_cubit.dart';
import 'package:manejadores_estado_app/models/usuario.dart';  

class Pagina2Page extends StatelessWidget {
   
  const Pagina2Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // llamamos el ususario cubit
    final UsuarioCubit usuarioCubit = context.read<UsuarioCubit>();
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
                final newUser = Usuario( // tenia new
                  nombre: 'Jeancarlos', 
                  edad: 37, 
                  profesiones: [
                    'Full stack Developer', 
                    'Jugador Beisbol'
                  ]
                );
                // lamar el cubit
                usuarioCubit.seleccionarUsuario(newUser);
              },
              child: const Text( 'Establecer Usuario', style: TextStyle(color: Colors.white) )
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                usuarioCubit.cambiarEdad(25);
              },
              child: const Text( 'Cambiar Edad', style: TextStyle(color: Colors.white) )
            ),MaterialButton(
              color: Colors.blue,
              onPressed: (){
                usuarioCubit.agregarProfesion('Equis Profesion');
              },
              child: const Text( 'Anadir Profesion', style: TextStyle(color: Colors.white) )
            ),

          ],
         ),
      ),
    );
  }
}