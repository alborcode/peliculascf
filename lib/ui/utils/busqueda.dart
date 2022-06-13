

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:peliculascf/providers/movies_provider.dart';

// Importamos Modelos
import 'package:peliculascf/models/models.dart';
// Importamos Widgets
import 'package:peliculascf/ui/widgets/widgets.dart';

// Clase que debe extender de SearchDelegate
class Busqueda extends SearchDelegate {

  // Sobreescribimos searchFieldLabel para que en vez de Search ponga el texto
  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        // Al pulsar en el boton de la x el query tendrá un string vacio
        IconButton(
          icon: Icon( Icons.clear ),
          onPressed: () => query = '',
        )
      ];
  }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Al dar al boton de regresar cierro ventana de busqueda devolviendo null
      return IconButton(
        icon: Icon( Icons.arrow_back ),
        onPressed: () {
          close(context, null );
        },
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      
      return Text('buildResults');
    }

    Widget contenedorVacio() {
      // Icono que se muestra en contenedor si no hay contenido
      return Container(
          child: Center(
            child: Icon(
              Icons.movie_creation_outlined,
              color: Colors.black38,
              size: 130,
            ),
          ),
        );
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    
      if( query.isEmpty ) {
        return contenedorVacio();
      }

      final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
      moviesProvider.buscarTermino( query );

      // En vez de un Future sera un StreamBuilder
      return StreamBuilder(
        // Escuchamos el Stream de busqueda
        stream: moviesProvider.busquedaStream,
        // Solo se llamara a Builder cunado el stream emita un valor
        builder: ( _, AsyncSnapshot<List<Pelicula>> snapshot) {
          // Si no hay datos se devolverá el contenedor vacio
          if( !snapshot.hasData ) return contenedorVacio();

          final movies = snapshot.data!;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: ( _, int index ) => PeliculaEncontrada( movies[index])
          );
        },
      );

  }

}
