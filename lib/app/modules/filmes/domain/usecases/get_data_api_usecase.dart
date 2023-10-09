import 'package:dartz/dartz.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/entities/filmes_entity.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/erros/filme_exception.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/repositories/get_data_api_repository.dart';

abstract class IGetFilmesUsecase {
  Future<Either<FilmeException, List<FilmesEntity>>> call();
}

class GetFilmesUseCase implements IGetFilmesUsecase {
  final IGetFilmesRepository _repository;

  GetFilmesUseCase(this._repository);

  @override
  Future<Either<FilmeException, List<FilmesEntity>>> call() async {
    return _repository();
  }
}
