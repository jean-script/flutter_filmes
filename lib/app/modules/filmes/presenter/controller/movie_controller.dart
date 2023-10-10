// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/entities/filmes_entity.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/erros/filme_exception.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/usecases/get_movie_usecase.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

class MovieController extends GetxController with StateMixin<FilmeEntity> {
  final IGetMovieUsecase _getMovie;
  FilmeEntity movie =
      FilmeEntity(id: 0, title: '', backdropPath: '', overview: '');

  MovieController(this._getMovie);
  FilmeEntity get filme => movie;
  late String? id;
  List listStorge = [];


  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.loading());

    id = Get.parameters['id'];

    id == null ? '' : await getMovieSelect(id!);
  }

  getMovieSelect(String id) async {
    Either<FilmeException, FilmeEntity> result;

    result = await _getMovie(id);

    result.fold((l) {
      print(l.message);
    }, (r) {
      movie = r;
      change(movie, status: RxStatus.success());
    });
  }

  void favoriteMovie(FilmeEntity movie) {
    final box = GetStorage();

    var isFavorite = box.read('@filme');

    if (isFavorite != null) {
      print('Filme já esta favoritado');
      return;
    }

    listStorge.add(isFavorite);

    box.write('@filme', json.encode(listStorge));
  }
}
