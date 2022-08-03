import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:manejadores_estado_app/bloc/usuario/usuario_cubit.dart';
import 'package:manejadores_estado_app/models/usuario.dart'; 

class Pagina1Page extends StatelessWidget {
   
  const Pagina1Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text( 'Pagina 1' )),
        actions: [
          IconButton(
            icon: const Icon(Icons.cleaning_services),
            onPressed: () => context.read<UsuarioCubit>().borrarUsuario(), 
          )
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.keyboard_backspace_sharp),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      // los Builder siempre tiene que regresar un Widget
      builder: (_, state) {
        print(state);  
        // (state as UsuarioActivo).usuario es una forma de leer el ususario OJO siempre que exista el usuario sino me marca error
        // preguntamos si estado es una instancia de usuarioInitial
        // se puede trabajar con un switch

        // if(state is UsuarioInitial){
        //   return const Center(child: Text( 'No hay informacion del Usuario' ));
        // }else if(state is UsuarioActivo){
        //   // ver el estate
        //   return InformacionUsuario( usuario: state.usuario );
        // }else{ // esto es para asegurar un widget al final evita error de non-null
        //   return const Center(child: Text('Estado No reconocido'));
        // }
        
        // lo hacemos con un switch
        switch (state.runtimeType) { 
          case UsuarioInitial: 
            return const Center(child: Text( 'No hay informacion del Usuario' )); 

          case UsuarioActivo: 
            return InformacionUsuario( usuario: (state as UsuarioActivo).usuario );

          default:
            return const Center(child: Text('Estado No reconocido')); 
        }
      },
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

            // esta es una forma
            // if(usuario.profesiones != null) 
            //   ...usuario.profesiones!.map((profesion) => ListTile( title: Text( 'Profesion: $profesion' ) )).toList(),

            if(usuario.profesiones != null)
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: usuario.profesiones!.length,
              itemBuilder: (_, int index) { 
                return ListTile( title: Text( 'Profesiones: ${usuario.profesiones![index]}') ); 
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