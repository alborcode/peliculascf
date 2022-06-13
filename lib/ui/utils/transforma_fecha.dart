
String transformaFecha(String fechaTransformar) {
  var fechaFinal = DateTime.parse(fechaTransformar);

  return "${fechaFinal.day.toString().padLeft(2,'0')}-${fechaFinal.month.toString().padLeft(2,'0')}-${fechaFinal.year}";
}