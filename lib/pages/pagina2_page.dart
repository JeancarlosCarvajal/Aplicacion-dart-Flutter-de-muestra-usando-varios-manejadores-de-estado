import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manejadores_estado_app/controllers/usuario_controller.dart';
import 'package:manejadores_estado_app/models/usuario.dart'; 

class Pagina2Page extends StatelessWidget {

   
  const Pagina2Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    // give the current args from currentScreen
    // print(Get.arguments);
    final usuarioCtrl = Get.find<UsuarioController>();

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
                usuarioCtrl.cargarUsuario(
                  Usuario(
                    nombre: 'Jeancarlos', 
                    edad: 37,
                    profesiones: [ 'Full Stack Developer', 'Beisbolista', 'Gamer' ]
                  )
                );
                // mmostrar un showbar es un mensaje modal
                Get.snackbar(
                  'Usuario establecido', 
                  'Jeancarlos es el nombre del usuario',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10
                    )
                  ]
                );
              },
              child: const Text( 'Establecer Usuario', style: TextStyle(color: Colors.white) )
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                usuarioCtrl.cambiarEdad(25);
              },
              child: const Text( 'Cambiar Edad', style: TextStyle(color: Colors.white) )
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                // usuarioCtrl.agregarProfesion('Astronauta');
                // usuarioCtrl.agregarProfesion('Profesion # ${usuarioCtrl.usuario.value.profesiones.length + 1}');  
                usuarioCtrl.agregarProfesion('Profesion # ${usuarioCtrl.profesionesCount +1}'); // profesionesCount
              },
              child: const Text( 'Anadir Profesion', style: TextStyle(color: Colors.white) )
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              child: const Text( 'Canbiar tema', style: TextStyle(color: Colors.white) )
            ),
          ],
         ),
      ),
    );
  }
}