
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Importamos Modelos
import 'package:peliculascf/models/models.dart';
// Importamos Widgets
import 'package:peliculascf/ui/widgets/widgets.dart';

import 'package:peliculascf/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class SliderCasting extends StatelessWidget {
  // Declaro el id que voy a recibir de la pelicula
  final int movieId;
  const SliderCasting( this.movieId );

  @override
  Widget build(BuildContext context) {

    // moviesProvider instancia de MoviesProvider. listen a false porque no queremos redibujar
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    // El FutureBuilder no tendra initialData
    return FutureBuilder(
      future: moviesProvider.recuperarActores(movieId),
      // El Async devuelve una lista de Cast
      builder: ( _, AsyncSnapshot<List<Cast>> snapshot) {
        // Si no tiene datos devuelve el indicador de progreso
        if( !snapshot.hasData ) {
          return Container(
            constraints: BoxConstraints(maxWidth: 150),
            height: 180,
            child: CupertinoActivityIndicator(),
          );
        }
        // En la lista cast guardo los datos recuperados
        final List<Cast> cast = snapshot.data!;
        return Container(
          margin: EdgeInsets.only( bottom: 30 ),
          width: double.infinity,
          height: 180,
          child: ListView.builder(
            itemCount: 10,
            // Ponemos Scroll horizontal para que mover tarjetas actores de izquierda a derecha
            scrollDirection: Axis.horizontal,
            itemBuilder: ( _, int index) => ActorCard( cast[index] ),
          ),
        );
      },
    );
  }
}
