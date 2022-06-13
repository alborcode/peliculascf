import 'package:flutter/material.dart';

// Importamos modelos
import 'package:peliculascf/models/models.dart';
// Importamos widgets
import 'package:peliculascf/ui/widgets/widgets.dart';

class SliderPeliculas extends StatefulWidget {

  final List<Pelicula> peliculas;
  final String? titulo;
  final Function paginaSiguiente;

  const SliderPeliculas({
    Key? key, 
    required this.peliculas,
    required this.paginaSiguiente,
    this.titulo,
  }) : super(key: key);

  @override
  SliderPeliculasState createState() => SliderPeliculasState();
}

class SliderPeliculasState extends State<SliderPeliculas> {
  // Creamos el ScrollController para en el initState poder usar un Listener
  final ScrollController scrollController = new ScrollController();

  // initState se llama la primera vez
  @override
  void initState() { 
    super.initState();
    scrollController.addListener(() {
      // Si la posicion del scrollController es mayor o igual que la maxima del scroll menos 500 px
      if ( scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500 ) {
        // Llama a peticion de siguiente pagina con la Funcion recibida.
        // Se pone como funcion para poder reutilizarse y no usarse solo para las mas populares
        widget.paginaSiguiente();
      }
    });
  }

  // Dispose se llama cuando el widget va a ser destruido
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Como el titulo es opcional solo lo muestro si se envia
          if ( this.widget.titulo != null )
            Padding(
              padding: EdgeInsets.symmetric( horizontal: 20 ),
              child: Text( this.widget.titulo!, style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ),),
            ),
          SizedBox( height: 5 ),
          // Ponemos Expanded para que se pueda hacer Scroll
          Expanded(
            child: ListView.builder(
              // El controller sera el ScrollController
              controller: scrollController,
              // Cambiamos la direccion del Scroll para que sea horizontal (de izquierda a derecha)
              scrollDirection: Axis.horizontal,
              itemCount: widget.peliculas.length,
              // Mostramos los poster de peliculas en el slider
              itemBuilder: ( _, int index) {
                // Llamamos a Widget Poster Pelicula
                return PosterPelicula(widget.peliculas[index],
                    '${ widget.titulo }-$index-${ widget.peliculas[index].id }');
              }
            ),
          ),
        ],
      ),
    );
  }
}
