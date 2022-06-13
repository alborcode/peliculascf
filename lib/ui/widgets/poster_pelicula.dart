/*
 Widget de Scrool de Poster de Peliculas se usara en SliderPeliculas
*/

import 'package:flutter/material.dart';

// Importamos modelos
import 'package:peliculascf/models/models.dart';


class PosterPelicula extends StatelessWidget {
  final Pelicula movie;
  final String heroId;
  const PosterPelicula( this.movie, this.heroId );

  @override
  Widget build(BuildContext context) {
    // Alimentamos el heroid con el recibido como argumento
    movie.heroId = heroId;
    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric( horizontal: 10 ),
      // Colocamos una columna para añadir varios elementos dentro del poster
      child: Column(
        children: [
          // Añadimos GestureDetector para al hacer click navegar hasta detalles
          GestureDetector(
            // Navegamos al hacer click enviando como argumento todos los datos de la pelicula
            onTap: () => Navigator.pushNamed(context, '/Detalles', arguments: movie ),
            // Envolvemos el ClipRRect en un Hero para hacer la animacion
            child: Hero(
              // La etiqueta deberá ser la misma y unica el Id de la pelicula
              tag: movie.heroId!,
              // Lo envolvemos en ClipRRect para poder especificar el borde
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  // Ponemos Placeholder para mostrar antes de cargar imagen
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage( movie.fullPosterImg ),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox( height: 5 ),
          Text(
            movie.title,
            // Decimos que como mucho ponga dos lineas de texto
            maxLines: 2,
            // Añado opcion overflow para que aparezca ... si no cabe
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

}