import 'package:flutter_filmes/app/binder/initial_bindinds.dart';
import 'package:flutter_filmes/app/pages/filme_favorito_page.dart';
import 'package:flutter_filmes/app/pages/filme_select_page.dart';
import 'package:flutter_filmes/app/pages/home_page.dart';
import 'package:get/get.dart';

abstract class MyRoutes {
  static const String home = '/';
  static const String filme = '/filme';
  static const String favorito = '/favorito';

  static final pages = <GetPage>[
    GetPage(
      name: home,
      page: () => const HomePage(),
      binding: InitialBindings(),
    ),
    GetPage(
      name: filme,
      page: () => const FilmeSelectPage(),
      binding: InitialBindings(),
    ),
    GetPage(
      name: favorito,
      page: () => const MovieFavoritePage(),
    ),
  ];
}
