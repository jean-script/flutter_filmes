import 'dart:convert';
import 'dart:io';

import 'package:flutter_filmes/app/modules/filmes/domain/entities/filmes_entity.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/erros/filme_exception.dart';
import 'package:flutter_filmes/app/modules/filmes/external/mapper.dart';
import 'package:flutter_filmes/app/modules/filmes/infra/datasources/get_movie_datasource.dart';

import 'package:http/http.dart' as http;

class GetMovieDatasourceImpl implements IGetMovieDatasource {
  @override
  Future<FilmeEntity> call(id) async {
    try {
      var url = Uri.https(
        'api.themoviedb.org',
        '/3/movie/$id',
        {'api_key': '50312f480190956cea28225ca24ca9ba', 'language': 'pt-BR'},
      );

      var response = await http.get(url);

      if (response.statusCode != 200) {
        throw FilmeException(message: 'Erro na requisição');
      }

      var data = json.decode(response.body);

      data = MovieSelectMapper.fromMap(data);

      return data;
    } catch (e) {
      throw FilmeException(message: e.toString());
    }
  }
}
