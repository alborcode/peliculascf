// CLASE ESTATICA DE RUTAS PARA USO SIN NECESIDAD DE INSTANCIAR CLASE

import 'package:flutter/material.dart';

// Importacion de Pantallas
import 'package:peliculascf/ui/screens/screens.dart';
// Importacion de Modelos
import 'package:peliculascf/models/models.dart';

class AppRoutes{

  // Definicion estatica de ruta inicial
  // uso initialRoute: AppRoutes.rutaInicial
  static const rutaInicial = '/home';

  // Definicion estatica de Mapa de Rutas
  // uso onGenerateRoute: AppRoutes.rutas
  static Map<String, Widget Function (BuildContext)> rutas = {
    '/Inicio'             : (BuildContext contest) => Inicio(),
    '/Detalles' : (BuildContext contest) => Detalles(),
  };

  // Definicion estatica de OnGenerateRoute
  // uso onGenerateRoute: AppRoutes.rutaInexistente
  static Route<dynamic> rutaInexistente (RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Inicio (),
    );
  }

  // Definicion de Menu como objeto con Ruta
  static final menuOpciones = <MenuOpcion>[
    MenuOpcion(
      ruta: '/Inicio',
      nombre: 'Inicio',
      pantalla: Inicio(),
      icono: Icons.area_chart,
    ),
    MenuOpcion(
      ruta: '/Detalles',
      nombre: 'Conversion de Longitudes',
      pantalla: Detalles(),
      icono: Icons.location_on,
    ),
  ];

  // Definicion para generar rutas de forma dinamica
  static Map<String, Widget Function (BuildContext)> generarRutasApp() {
    Map<String, Widget Function (BuildContext)> appRoutes = {};
    for (final opcion in menuOpciones){
      appRoutes.addAll({opcion.ruta: (BuildContext context) => opcion.pantalla});
    }
    return appRoutes;
  }

}