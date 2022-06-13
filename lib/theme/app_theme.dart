// Clase con propiedades estaticas para que no sea necesario crear instancia
// Definimos las caracteristicas del Apptheme a usar

import 'package:flutter/material.dart';

class AppTheme{
  static const Color primario = Colors.orange;

  static final ThemeData miTema = ThemeData.light().copyWith(
      primaryColor: Colors.orangeAccent[300],
      appBarTheme: const AppBarTheme(
          color: primario,
          elevation: 0
      ),
      // FloatingAction Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primario,
          elevation: 5
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: primario,
              shape: const StadiumBorder(),
              elevation: 0
          )
      ),
      // Personalizacion del Tema para formularios
      inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: primario),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide( color: primario),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide( color: primario),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
              )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
              )
          )
      ),
      // Añadimos TextTheme para cambiar los colores de los textos
      /*textTheme: const TextTheme(
       subtitle1: TextStyle(color: primario),
       headline5: TextStyle(color: primario),
        caption: TextStyle(color: primario),
    ),*/
  );
}