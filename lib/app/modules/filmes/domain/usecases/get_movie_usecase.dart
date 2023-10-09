import 'package:dartz/dartz.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/entities/filmes_entity.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/erros/filme_exception.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/repositories/get_movie_repository.dart';

abstract class IGetMovieUsecase {
  Future<Either<FilmeException, FilmeEntity>> call(String id);
}

class GetMovieUsecase implements IGetMovieUsecase {
  final IGetMovieRepository _repository;

  GetMovieUsecase(this._repository);

  @override
  Future<Either<FilmeException, FilmeEntity>> call(String id) async {
    if (id == null || id == '') {
      throw FilmeException(message: 'id esta null');
    }

    return _repository(id);
  }
}
