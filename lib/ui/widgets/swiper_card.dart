
import 'package:flutter/material.dart';

//import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:card_swiper/card_swiper.dart';

// Importamos Modelos
import 'package:peliculascf/models/models.dart';


class SwiperCard extends StatelessWidget {

  final List<Pelicula> peliculas;

  const SwiperCard({
    Key? key, 
    required this.peliculas
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    // Si aun no he cargado peliculas cargara un indicador de progreso
    if( this.peliculas.length == 0) {
      return Container(
        width: double.infinity,
        // Tendra el 50% del alto de la pantalla
        height: size.height * 0.5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      // Tendra el 50% del alto de la pantalla
      height: size.height * 0.5,
      child: Swiper(
        itemCount: peliculas.length,
        layout: SwiperLayout.STACK,
        //pagination: SwiperPagination(),
        control: SwiperControl(),
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: ( BuildContext context , int index ) {
          final pelicula = peliculas[index];
          pelicula.heroId = 'swiper-${ pelicula.id }';
          // Envolvemos en GestureDetector para poder poner onTap al hacer click
          return GestureDetector(
            // Al hacer click navego a la pantalla de Detalles enviando la pelicula como parametro
            onTap: () => Navigator.pushNamed(context, '/Detalles', arguments: pelicula),
            // Envolvenos el ClipRRect en el Hero para hacer una animacion
            child: Hero(
              // La eqtiqueta como debe ser unica moveremos el Id de la pelicula
              tag: pelicula.heroId!,
              // Envolvemos el FadeInImage en un ClipRRect para poder poner borde redondeado
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  // Carga primero la imagen de placeholder y despues la imagen
                  placeholder: AssetImage('assets/images/no-image.jpg'),
                  // Llamamos a fullPosterImg del modelo Pelicula para recuperar la ruta completa de la imagen
                  image: NetworkImage( pelicula.fullPosterImg ),
                  // Adaptamos imagen a contenedor
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}