// To parse this JSON providers, do
//
//     final ResponseEnCines = ResponseEnCinesFromMap(jsonString);

import 'dart:convert';

import 'package:peliculascf/models/models.dart';

class ResponseEnCines {
  
    ResponseEnCines({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    ResponseFechas dates;
    int page;
    List<Pelicula> results;
    int totalPages;
    int totalResults;

    // Crea un Mapa basado en un Json
    factory ResponseEnCines.fromJson(String str) => ResponseEnCines.fromMap(json.decode(str));

    factory ResponseEnCines.fromMap(Map<String, dynamic> json) => ResponseEnCines(
        dates        : ResponseFechas.fromMap(json["dates"]),
        page         : json["page"],
        results      : List<Pelicula>.from( json["results"].map((x) => Pelicula.fromMap(x))),
        totalPages   : json["total_pages"],
        totalResults : json["total_results"],
    );
}

