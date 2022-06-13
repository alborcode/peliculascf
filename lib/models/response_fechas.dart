
import 'dart:convert';

class ResponseFechas {
  ResponseFechas({
    required this.fechaMaxima,
    required this.fechaMinima,
  });

  DateTime fechaMaxima;
  DateTime fechaMinima;

  factory ResponseFechas.fromJson(String str) => ResponseFechas.fromMap(json.decode(str));

  factory ResponseFechas.fromMap(Map<String, dynamic> json) => ResponseFechas(
    fechaMaxima: DateTime.parse(json["maximum"]),
    fechaMinima: DateTime.parse(json["minimum"]),
  );
}
