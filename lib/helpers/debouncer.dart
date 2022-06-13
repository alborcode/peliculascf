import 'dart:async';
// Creditos
// https://stackoverflow.com/a/52922130/7834829

// Clase generica recibire algun tipo de dato
class Debouncer<T> {

  Debouncer({
    // duration es la cantidad de tiempo a esperar antes de emitir un valor
    required this.duration, 
    this.onValue 
  });

  final Duration duration;

  void Function(T value)? onValue;

  T? _value;
  Timer? _timer;
  
  T get value => _value!;

  set value(T val) {
    _value = val;
    // cancelamos el timer despues de recibir el valor
    _timer?.cancel();
    // Si el timer cumple la duracion que especificamos mandamos el valor
    _timer = Timer(duration, () => onValue!(_value!));
  }  
}