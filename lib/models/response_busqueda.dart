// To parse this JSON providers, do
//
//     final ResponseBusqueda = ResponseBusquedaFromMap(jsonString);

import 'dart:convert';

import 'package:peliculascf/models/models.dart';

class ResponseBusqueda {
    ResponseBusqueda({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<Pelicula> results;
    int totalPages;
    int totalResults;

    factory ResponseBusqueda.fromJson(String str) => ResponseBusqueda.fromMap(json.decode(str));

    factory ResponseBusqueda.fromMap(Map<String, dynamic> json) => ResponseBusqueda(
        page         : json["page"],
        results      : List<Pelicula>.from(json["results"].map((x) => Pelicula.fromMap(x))),
        totalPages   : json["total_pages"],
        totalResults : json["total_results"],
    );

}
