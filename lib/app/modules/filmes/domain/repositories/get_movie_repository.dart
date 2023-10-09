import 'package:dartz/dartz.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/entities/filmes_entity.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/erros/filme_exception.dart';

abstract class IGetMovieRepository {
  Future<Either<FilmeException, FilmeEntity>> call(String id);
}
