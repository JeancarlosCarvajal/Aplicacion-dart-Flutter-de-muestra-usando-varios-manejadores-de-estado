import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:manejadores_estado_app/pages/pagina1_page.dart';
import 'package:manejadores_estado_app/pages/pagina2_page.dart';
import 'package:manejadores_estado_app/services/usuarios_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // lazsy en false crea la instancia tan pronto se crea este widget
        // por defecto es true es decir se crea cuando la llamen
        ChangeNotifierProvider(create: (_) => new UsuariosService())
      ],
      // lo que esta debajo es decir toda la apliicacion tiene acceso al provider
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => Pagina1Page(),
          'pagina2': (_) => Pagina2Page()
        },
      ),
    );
  }
}