import 'package:flutter/material.dart';

// Importamos Modelos
import 'package:peliculascf/models/models.dart';

class Sinopsis extends StatelessWidget {
  final Pelicula movie;
  const Sinopsis(this.movie);

  @override
  Widget build(BuildContext context) {
    // Variable para llamar al TexTheme
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 30, vertical: 10),
      child: Text(
        movie.overview,
        // Lo ponemos con alineacion justify para que el texto quede alienado tipo documento
        textAlign: TextAlign.justify,
        style: textTheme.subtitle1,
      ),
    );
  }
}
