// ignore_for_file: public_member_api_docs, sort_constructors_first

class FilmesEntity {
  final int id;
  final String title;
  final String posterPath;

  FilmesEntity({
    required this.id,
    required this.title,
    required this.posterPath,
  });
}

class FilmeEntity {
  final int id;
  final String title;
  final String backdropPath;
  final String overview;

  FilmeEntity({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overview,
  });
}
