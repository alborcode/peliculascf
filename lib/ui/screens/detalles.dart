import 'package:flutter/material.dart';

// Importamos Modelos
import 'package:peliculascf/models/models.dart';
// Importamos Widgets
import 'package:peliculascf/ui/widgets/widgets.dart';

class Detalles extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    // Definimos la variable movie de tipo Pelicula
    // le decimos on settings.arguments para poder leer los argumentos
    // Añadimos ! porque los argumentos pueden ser opcionales
    final Pelicula movie = ModalRoute.of(context)!.settings.arguments as Pelicula;

    return Scaffold(
      // Usamos CustomScrollView que recibe Slivers.
      // Lo Slivers son widgets con cierto comportamiento al hacer scroll en el padre
      body: CustomScrollView(
        slivers: [
          // Llamo a Appbar personalizado mandando los datos de movie
          AppBarPersonalizado( movie ),
          SliverList(
            delegate: SliverChildListDelegate([
              PosterTitulo( movie ),
              Sinopsis( movie ),
              // Mandamos el id de la pelicula para construir el Slider de Casting
              SliderCasting( movie.id )
            ])
          )
        ],
      )
    );
  }
}




