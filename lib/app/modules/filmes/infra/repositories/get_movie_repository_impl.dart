import 'package:dartz/dartz.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/entities/filmes_entity.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/erros/filme_exception.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/repositories/get_movie_repository.dart';
import 'package:flutter_filmes/app/modules/filmes/infra/datasources/get_movie_datasource.dart';

class GetMovieRepositoryImpl implements IGetMovieRepository {
  final IGetMovieDatasource _datasource;

  GetMovieRepositoryImpl(this._datasource);

  @override
  Future<Either<FilmeException, FilmeEntity>> call(String id) async {
    try {
      return Right(await _datasource(id));
    } on FilmeException catch (e) {
      return Left(e);
    } on Exception {
      return Left(FilmeException(message: 'Erro inesperado'));
    }
  }
}
