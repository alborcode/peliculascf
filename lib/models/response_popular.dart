// To parse this JSON providers, do
//
//     final ResponsePopular = ResponsePopularFromMap(jsonString);

import 'dart:convert';

import 'package:peliculascf/models/models.dart';

class ResponsePopular {
    ResponsePopular({
        required this.pagina,
        required this.resultados,
        required this.totalPaginas,
        required this.totalResultados,
    });

    int pagina;
    List<Pelicula> resultados;
    int totalPaginas;
    int totalResultados;

    factory ResponsePopular.fromJson(String str) => ResponsePopular.fromMap(json.decode(str));

    factory ResponsePopular.fromMap(Map<String, dynamic> json) => ResponsePopular(
        pagina: json["page"],
        resultados: List<Pelicula>.from(json["results"].map((x) => Pelicula.fromMap(x))),
        totalPaginas: json["total_pages"],
        totalResultados: json["total_results"],
    );
}

