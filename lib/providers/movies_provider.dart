/*
CLASE
*/

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

// Importamos Modelos
import 'package:peliculascf/models/models.dart';
// Importamos Helpers
import 'package:peliculascf/helpers/helpers.dart';

// Para que sea un Provider hay que extender la clase de ChangeNotifier
class MoviesProvider extends ChangeNotifier {

  //String _apiKey   = '1865f43a0549ca50d341dd9ab8b29f49';
  String _apiKey   = 'b079d23058a29b67b1d53d510bcae8dc';
  String _baseUrl  = 'api.themoviedb.org';
  String _language = 'es-ES';
  String _genres   = '14 | 878';
  // String _genres   = '16'; // Animacion
  // String _genres   = '14'; // Fantasia
  // String _genres   = '878'; // Ciencia Ficcion

  // Arreglos donde guardar el Response de en cartelera y populares
  List<Pelicula> enCartelera = [];
  List<Pelicula> populares   = [];

  // Mapa para el id de la pelicula y el resultado del listado de Cast
  Map<int, List<Cast>> moviesCast = {};
  // Inicializo la pagina de recuperar Populares
  int paginaPopulares = 0;

  // Creamos el Debouncer conn la duracion de 500 milisegundos (0.5 segundos)
  final debouncer = Debouncer(
    duration: Duration( milliseconds: 500 ),
  );

  // Definimos un StreamController que recibira una lista de Peliculas
  final StreamController<List<Pelicula>> busquedaStreamContoller = new StreamController.broadcast();
  // Definimos el Stream que sera un getter y devolvera el stream del controller
  Stream<List<Pelicula>> get busquedaStream => this.busquedaStreamContoller.stream;


  // El constructor llamara a las peliculas en carterlera y a las populares
  MoviesProvider() {
    print('MoviesProvider inicializado');
    this.recuperarCartelera();
    this.recuperarPopulares();
  }

  // Future usado en recuperCartelera y RecuperarPopulares dado que comparten codigo
  // Recibira como argumento el path del API y el numero de pagina que sera opcional
  Future<String> recuperarJsonData( String path, [int page = 1] ) async {
    final url = Uri.https( _baseUrl, path, {
      'api_key': _apiKey,
      'language': _language,
      'with_genres': _genres,
      'page': '$page'
    });
    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }


  recuperarCartelera() async {
    // La variable jsonData almacenara la llamada a recuperarJsonData
    final jsonData = await this.recuperarJsonData('3/movie/now_playing');
    https://api.themoviedb.org/3/discover/movie
    final nowPlayingResponse = ResponseEnCines.fromJson(jsonData);
    enCartelera = nowPlayingResponse.results;
    // Al extender de ChangeNotifier podemos usar notifyListeners donde indicamos
    // que ha habido un cambio en los datos y solo se redibujara aquellos que tuvieron un cambio
    notifyListeners();
  }

  recuperarPopulares() async {
    // Incremento el valor de paginaPopulares para llamar desde la pagina 1
    paginaPopulares++;
    // La variable jsonData almacenara la llamada a recuperarJsonData
    final jsonData = await this.recuperarJsonData('3/movie/popular', paginaPopulares );
    final popularResponse = ResponsePopular.fromJson( jsonData );
    // Desestructuramos el objeto con ...
    // Cogera las peliculas actuales y le concatenera los resultados
    populares = [ ...populares, ...popularResponse.resultados ];
    notifyListeners();
  }

  // Future que recupera un listado de Cast (solo uno)
  Future<List<Cast>> recuperarActores( int movieId ) async {
    // Si existe en el mapa moviesCast una ID lo devuelvo solo se realiza la peticion una vez
    if( moviesCast.containsKey(movieId) ) return moviesCast[movieId]!;

    final jsonData = await this.recuperarJsonData('3/movie/$movieId/credits');
    final creditsResponse = ResponseCreditos.fromJson( jsonData );
    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  // Future para buscar Peliculas que devuelve una lista de peliculas
  Future<List<Pelicula>> buscarPeliculas( String query ) async {
    final url = Uri.https( _baseUrl, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query
    });
    final response = await http.get(url);
    final searchResponse = ResponseBusqueda.fromJson( response.body );
    return searchResponse.results;
  }

  // Funcion para usar el Debouncer personalizado emita el valor hasta que se deje de escribir
  void buscarTermino( String terminoBusqueda ) {
    debouncer.value = '';
    // Cuando pasen las 500 ms de segundo llamo al onvalue del Debouncer
    debouncer.onValue = ( value ) async {
      // print('Tenemos valor a buscar: $value');
      final results = await this.buscarPeliculas(value);
      // Añadimo un nuevo evento para que sepa lo que esta pasando
      this.busquedaStreamContoller.add( results );
    };
    // Cada 300 milisegundos se ejecuta y el valor del debouncer sera el searchTerm
    final timer = Timer.periodic(Duration(milliseconds: 300), ( _ ) { 
      debouncer.value = terminoBusqueda;
    });
    // un milisegundo despues cancelo el timer
    Future.delayed(Duration( milliseconds: 301)).then(( _ ) => timer.cancel());
  }

}