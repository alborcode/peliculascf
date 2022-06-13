import 'package:flutter/material.dart';

// Importamos Modelos
import 'package:peliculascf/models/models.dart';

class PosterTitulo extends StatelessWidget {
  final Pelicula movie;
  const PosterTitulo( this.movie );

  @override
  Widget build(BuildContext context) {
    // Variable para llamar al TexTheme
    final TextTheme textTheme = Theme.of(context).textTheme;
    // Variable para llamar al size MediaQuery
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only( top: 20 ),
      padding: EdgeInsets.symmetric( horizontal: 20 ),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage( movie.fullPosterImg ),
                height: 150,
              ),
            ),
          ),
          SizedBox( width: 20 ),
          // Usamos un ConstrainedBox para evitar overflow de los textos
          ConstrainedBox(
            // Damos el ancho máximo restando la imagen y margenes de la izquierda
            constraints: BoxConstraints( maxWidth: size.width - 190 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( movie.title,
                    style: textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2
                ),
                Text( movie.originalTitle,
                    style: textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2
                ),
                // Creamos Fila para crear las valoraciones
                Row(
                  children: [
                    Icon( Icons.star_outline, size: 15, color: Colors.grey ),
                    SizedBox( width: 5 ),
                    Text( '${movie.voteAverage}', style: textTheme.caption )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}