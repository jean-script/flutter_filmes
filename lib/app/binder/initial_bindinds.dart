import 'package:flutter_filmes/app/modules/filmes/domain/repositories/get_data_api_repository.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/repositories/get_movie_repository.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/usecases/get_data_api_usecase.dart';
import 'package:flutter_filmes/app/modules/filmes/domain/usecases/get_movie_usecase.dart';
import 'package:flutter_filmes/app/modules/filmes/external/get_data_api_datasource_impl.dart';
import 'package:flutter_filmes/app/modules/filmes/external/get_movie_datasource_impl.dart';
import 'package:flutter_filmes/app/modules/filmes/infra/datasources/get_data_api_datasource.dart';
import 'package:flutter_filmes/app/modules/filmes/infra/datasources/get_movie_datasource.dart';
import 'package:flutter_filmes/app/modules/filmes/infra/repositories/get_data_api_repository_impl.dart';
import 'package:flutter_filmes/app/modules/filmes/infra/repositories/get_movie_repository_impl.dart';
import 'package:flutter_filmes/app/modules/filmes/presenter/controller/filmes_controller.dart';
import 'package:flutter_filmes/app/modules/filmes/presenter/controller/movie_controller.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    // use case Get data
    Get.lazyPut<IGetFilmesDatasource>(() => GetFilmesDatasourceImpl());
    Get.lazyPut<IGetFilmesRepository>(
        () => GetFilmesRepositoryImpl(Get.find()));
    Get.lazyPut<IGetFilmesUsecase>(() => GetFilmesUseCase(Get.find()));

    // usecase Movie
    Get.lazyPut<IGetMovieDatasource>(() => GetMovieDatasourceImpl());
    Get.lazyPut<IGetMovieRepository>(() => GetMovieRepositoryImpl(Get.find()));
    Get.lazyPut<IGetMovieUsecase>(() => GetMovieUsecase(Get.find()));

    // controller
    Get.lazyPut(() => FilmesController(Get.find()));
    Get.lazyPut(() => MovieController(Get.find()));
  }
}
