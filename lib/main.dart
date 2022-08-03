import 'package:flutter/material.dart';
import 'package:manejadores_estado_app/pages/pagina1_page.dart';
import 'package:manejadores_estado_app/pages/pagina2_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'pagina1',
      routes: {
        'pagina1': (_) => const Pagina1Page(),
        'pagina2': (_) => const Pagina2Page()
      },
    );
  }
}