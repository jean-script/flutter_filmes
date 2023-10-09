import 'package:dartz/dartz.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/entities/filmes_entity.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/erros/filme_exception.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/repositories/get_data_api_repository.dart';
import 'package:flutter_filmes/app/modules/filmes/infra/datasources/get_data_api_datasource.dart';

class GetFilmesRepositoryImpl implements IGetFilmesRepository {
  final IGetFilmesDatasource _datasource;

  GetFilmesRepositoryImpl(this._datasource);

  @override
  Future<Either<FilmeException, List<FilmesEntity>>> call() async {
    try {
      return Right(await _datasource());
    } on FilmeException catch (e) {
      return Left(e);
    } on Exception {
      return Left(FilmeException(message: 'Erro inesperado'));
    }
  }
}
