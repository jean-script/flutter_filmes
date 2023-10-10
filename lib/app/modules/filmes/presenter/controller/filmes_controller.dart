// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/entities/filmes_entity.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/erros/filme_exception.dart';
import 'package:get/get.dart';

import 'package:flutter_filmes/app/modules/filmes/domain/usecases/get_data_api_usecase.dart';

class FilmesController extends GetxController
    with StateMixin<List<FilmesEntity>> {
  final IGetFilmesUsecase _getData;
  List<FilmesEntity> data = [];
  RxBool loading = false.obs;

  FilmesController(
    this._getData,
  );

  List<FilmesEntity> get filmes => data;
  late String? id;

  @override
  void onInit() async {
    super.onInit();

    change(null, status: RxStatus.loading());

    loading.value = true;

    id = Get.parameters['id'];

    await getAllMovies();
  }

  getAllMovies() async {
    Either<FilmeException, List<FilmesEntity>> result;

    result = await _getData();

    result.fold((l) {
      print(l.message);
      loading.value = false;
      change(null, status: RxStatus.error());
    }, (r) {
      data = r;
      loading.value = false;
      change(data, status: RxStatus.success());
    });
  }
}
