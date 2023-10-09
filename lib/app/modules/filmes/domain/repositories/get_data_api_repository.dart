import 'package:dartz/dartz.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/entities/filmes_entity.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/erros/filme_exception.dart';

abstract class IGetFilmesRepository {
  Future<Either<FilmeException, List<FilmesEntity>>> call();
}
