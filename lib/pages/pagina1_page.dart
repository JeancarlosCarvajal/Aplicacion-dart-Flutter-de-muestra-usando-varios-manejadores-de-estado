import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:manejadores_estado_app/bloc/user/user_bloc.dart';
import 'package:manejadores_estado_app/models/usuario.dart'; 

class Pagina1Page extends StatelessWidget {
   
  const Pagina1Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text( 'Pagina 1' )),
      ),
      // cada vez que hay un cambio en el state este widget se va reconstruir con la informacion
      body: BlocBuilder<UserBloc, UserState>(
        // buildWhen: , // muy util
        builder: (context, state) {  
          return state.existUser
          ? InformacionUsuario(user: state.user!)
          : const Center(child: Text( 'No hay usuario seleccionado' )); 
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
  final User user;
  
  const InformacionUsuario({
    Key? key, 
    required this.user,
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
      
            ListTile( title: Text( 'Nombre: ${user.nombre}' ) ),
            ListTile( title: Text( 'Edad:  ${user.edad}' ) ),
      
            const Text( 'Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold) ),
            const Divider(),

            if( user.profesiones != null)
            ListView.builder(
              shrinkWrap: true,
              itemCount:  user.profesiones!.length,
              itemBuilder: (_, int index) { 
                return ListTile( title: Text( 'Profesion :  ${user.profesiones![index] }' ) );
              }
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