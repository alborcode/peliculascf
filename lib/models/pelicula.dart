/*
app.quicktype.io para generar clase de json devuelto
*/

import 'dart:convert';

class Pelicula {
    Pelicula({
        required this.adult,
        this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        this.posterPath,
        this.releaseDate,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    bool adult;
    String? backdropPath;
    List<int> genreIds;
    int id;
    String originalLanguage;
    String originalTitle;
    String overview;
    double popularity;
    String? posterPath;
    String? releaseDate;
    String title;
    bool video;
    double voteAverage;
    int voteCount;

    // Propiedad para hacer el id unico en las animaciones hero
    String? heroId;

    // Metodo para recuperar el Path completo de la imagen dado que solo viene el archivo jpg
    get fullPosterImg {
      // Si la imagen viene rellena
      if ( this.posterPath != null )
        return 'https://image.tmdb.org/t/p/w500${ this.posterPath }';
      // Si no se envia imagen generica
      return 'https://i.stack.imgur.com/GNhxO.png';
    }

    get fullBackdropPath {
      if ( this.backdropPath != null )
        return 'https://image.tmdb.org/t/p/w500${ this.backdropPath }';

      return 'https://i.stack.imgur.com/GNhxO.png';
    }


    factory Pelicula.fromJson(String str) => Pelicula.fromMap(json.decode(str));

    factory Pelicula.fromMap(Map<String, dynamic> json) => Pelicula(
        adult           : json["adult"],
        backdropPath    : json["backdrop_path"],
        genreIds        : List<int>.from(json["genre_ids"].map((x) => x)),
        id              : json["id"],
        originalLanguage: json["original_language"],
        originalTitle   : json["original_title"],
        overview        : json["overview"],
        popularity      : json["popularity"].toDouble(),
        posterPath      : json["poster_path"],
        releaseDate     : json["release_date"],
        title           : json["title"],
        video           : json["video"],
        voteAverage     : json["vote_average"].toDouble(),
        voteCount       : json["vote_count"],
    );
}

