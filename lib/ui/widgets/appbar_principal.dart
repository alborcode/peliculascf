
import 'package:flutter/material.dart';

// Importamos Modelos
import 'package:peliculascf/models/models.dart';

class AppBarPrincipal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Usamos SliverAppBar para controlar el ancho y alto del Appbar
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      // Tendra un tamaño mas grande inicialmente
      expandedHeight: 200,
      floating: false,
      // Para que desaparezca al hacer scroll
      pinned: false,
      // Con FlexibleSpace acomodamos los hijos al Appbar
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        // COntenedor que contendra el texto
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only( bottom: 10, left: 10, right: 10),
          color: Colors.black12,
          child: Text('Estrenos Peliculas CF',
            style: TextStyle( fontSize: 16 ),
            textAlign: TextAlign.center,
          ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.red,
                ]
              ),
            )
        ),
      ),
    );
  }
}