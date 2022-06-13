

import 'package:flutter/material.dart';
import 'package:peliculascf/models/models.dart';
import 'package:provider/provider.dart';
import 'package:peliculascf/providers/movies_provider.dart';

class PeliculaEncontrada extends StatelessWidget {

  final Pelicula movie;

  const PeliculaEncontrada( this.movie );

  @override
  Widget build(BuildContext context) {

    // Para que el Hero id sea unico concatenamos search y el movie Id
    movie.heroId = 'search-${ movie.id }';

    return ListTile(
      // Añadimos animacion Hero pasando como etqieueta el movie.heroId
      leading: Hero(
        tag: movie.heroId!,
        // Ponemos un FadeinImage para que cargue una imagen mientras carga
        child: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'),
          image: NetworkImage( movie.fullPosterImg ),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text( movie.title ),
      subtitle: Text( movie.originalTitle ),
      onTap: () {
        // Llamo a pantalla de detalles mandando como argumento la pelicula
        Navigator.pushNamed(context, '/Detalles', arguments: movie );
      },
    );
  }
}