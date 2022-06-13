
import 'package:flutter/material.dart';

// Importamos Modelos
import 'package:peliculascf/models/models.dart';

class AppBarPersonalizado extends StatelessWidget {
  final Pelicula movie;
  const AppBarPersonalizado( this.movie );

  @override
  Widget build(BuildContext context) {
    // Usamos SliverAppBar para controlar el ancho y alto del Appbar
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      // Tendra un tamaño mas grande inicialmente
      expandedHeight: 200,
      floating: false,
      // Para que no desaparezca al hacer scroll
      pinned: true,
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
          child: Text(
            movie.title,
            style: TextStyle( fontSize: 16 ),
            textAlign: TextAlign.center,
          ),
        ),
        // Añadimos como Fondo del SilverApp un FadeInImage con imagen previa
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage( movie.fullBackdropPath ),
          // Decimos que ajuste la imagen a contenedor
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}