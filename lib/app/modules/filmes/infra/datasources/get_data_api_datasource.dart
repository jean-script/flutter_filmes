import 'package:flutter_filmes/app/modules/filmes/domain/entities/filmes_entity.dart';

abstract class IGetFilmesDatasource {
  Future<List<FilmesEntity>> call();
}
