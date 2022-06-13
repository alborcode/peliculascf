/*
Clase Principal de Entrada de Aplicacion
*/

import 'package:flutter/material.dart';

// Importamos el Tema de la Aplicacion
import 'package:peliculascf/theme/app_theme.dart';
// Importamos Rutas de la Aplicacion para Navegacion
import 'package:peliculascf/routes/app_routes.dart';

// Importamos Pantallas para llamadas
import 'package:peliculascf/ui/screens/screens.dart';


class AppPeliculasCF extends StatelessWidget {
  const AppPeliculasCF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Quitamos bandera Debug
        debugShowCheckedModeBanner: false,
        title: 'Películas',
        // Configuramos el tema con el personalizado
        theme: AppTheme.miTema,
        // La pantalla Inicial sera Inicio
        home: Inicio(),
        // Cargamos la ruta inicial
        initialRoute: '/Inicio',
        // Cargamos las rutas de navegacion
        routes: AppRoutes.rutas
    );
  }
}

