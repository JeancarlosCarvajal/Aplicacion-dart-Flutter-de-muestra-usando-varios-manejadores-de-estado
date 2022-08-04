import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:manejadores_estado_app/bloc/user/user_bloc.dart';
import 'package:manejadores_estado_app/models/usuario.dart'; 

class Pagina2Page extends StatelessWidget {
   
  const Pagina2Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) { 
    // hacemos referencia al Bloc
    final userBloc =BlocProvider.of<UserBloc>(context, listen: false);

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
                final User newUser = User( // tenia new 
                  nombre: 'Jeancarlos', 
                  edad: 37,
                  profesiones: ['Full Stack Developer', 'Beisbolista']
                );

                userBloc.add(ActivateUserEvent(newUser));

              },
              child: const Text( 'Establecer Usuario', style: TextStyle(color: Colors.white) )
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                userBloc.add(ChangeUserAgeEvent(25));
              },
              child: const Text( 'Cambiar Edad', style: TextStyle(color: Colors.white) )
            ),MaterialButton(
              color: Colors.blue,
              onPressed: (){
                userBloc.add(ChangeProfesionEvent('Astronauta'));
              },
              child: const Text( 'Anadir Profesion', style: TextStyle(color: Colors.white) )
            ),

          ],
         ),
      ),
    );
  }
}