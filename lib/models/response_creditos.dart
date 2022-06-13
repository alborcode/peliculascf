// To parse this JSON providers, do
//
//     final ResponseCreditos = ResponseCreditosFromMap(jsonString);

import 'dart:convert';

// Importamos Modelos
import 'package:peliculascf/models/models.dart';

class ResponseCreditos {
    ResponseCreditos({
        required this.id,
        required this.cast,
        required this.crew,
    });

    int id;
    List<Cast> cast;
    List<Cast> crew;

    factory ResponseCreditos.fromJson(String str) => ResponseCreditos.fromMap(json.decode(str));


    factory ResponseCreditos.fromMap(Map<String, dynamic> json) => ResponseCreditos(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
    );

}
