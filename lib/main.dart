
import 'package:flutter/material.dart';
// Usamos Provider como gestor de estado
import 'package:provider/provider.dart';

// Importamos Clase para llamada a Aplicacion
import 'app_peliculascf.dart';

import 'package:peliculascf/providers/movies_provider.dart';

// Llamamos en el Main a llamar al Estado de la Aplicacion
void main() => runApp(AppState());

// Clase para el Estado de la Aplicacion
class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Usamos Multiprovider aunque tenemos un solo Provider
    return MultiProvider(
      providers: [
        // Si se notifica un cambio en el provider se crea primera instancia de MoviesProvider
        // Ponemos lazy en false para que cuando se cree el widget mande a inicializar el mismmo
        ChangeNotifierProvider(create: ( _ ) => MoviesProvider(), lazy: false ),
      ],
      // El hijo sera la Clase de la Aplicacion
      child: AppPeliculasCF(),
    );
  }
}
