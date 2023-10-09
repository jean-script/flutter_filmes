import 'package:flutter_filmes/app/modules/filmes/domain/entities/filmes_entity.dart';

class FilmesMapper extends FilmesEntity {
  FilmesMapper({
    required super.id,
    required super.title,
    required super.posterPath,
  });

  factory FilmesMapper.fromMap(Map<String, dynamic> map) {
    return FilmesMapper(
      id: map['id'],
      title: map['title'],
      posterPath: map['poster_path'],
    );
  }
}

class MovieSelectMapper extends FilmeEntity {
  MovieSelectMapper({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
  });

  factory MovieSelectMapper.fromMap(Map<String, dynamic> map) {
    return MovieSelectMapper(
      id: map['id'],
      title: map['title'],
      backdropPath: map['backdrop_path'],
      overview: map['overview'],
    );
  }
}
