import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:peliculascf/ui/utils/busqueda.dart';
import 'package:peliculascf/providers/movies_provider.dart';
import 'package:peliculascf/ui/widgets/widgets.dart';


class Inicio extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Declaramos variable que traera instancia de Movies Provider
    // por defecto tendra listen a true para redibujar cuando haya algun cambio
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon( Icons.search_outlined ),
            // Llamamos a showSearch mandando el context y el delegate
            onPressed: () => showSearch(context: context, delegate: Busqueda() ),
          )
        ],
      ),
      // Envolvemos en SingleChildScroolView para evitar overflow y poder hacer scroll
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tarjetas principales. Mando el moviesProvider enCartelera definido
            SwiperCard( peliculas: moviesProvider.enCartelera ),
            // Slider de películas. Mando el moviesProvider populares definido
            SliderPeliculas(
              peliculas: moviesProvider.populares,
              titulo: 'Populares', // opcional
              // Se pasa la funcion a llamar cuando se necesite pagina siguiente
              paginaSiguiente: () => moviesProvider.recuperarPopulares(),
            ),
            
          ],
        ),
      )
    );
  }
}