import 'package:flutter/material.dart'; 
import 'package:get/get.dart';
import 'package:manejadores_estado_app/pages/pagina1_page.dart';
import 'package:manejadores_estado_app/pages/pagina2_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // el Getx tambien controla varias formas de la aplicacion
    // permite usar la Navegacion diferente, el problema es que si queremos migrarg a otro ej a Bloc se debe hacer muchas modificaciones
    // Se dice que Getx es practicamente un FrameWork
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'pagina1',
      // routes: { // rutas de la forma normal sin Getx
      //   'pagina1': (_) => const Pagina1Page(),
      //   'pagina2': (_) => const Pagina2Page()
      // },
      getPages: [ // con Getx
        GetPage(name: '/pagina1', page: () => const Pagina1Page()),
        GetPage(name: '/pagina2', page: () => const Pagina2Page()),
      ],
    );
  }
}