// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_filmes/app/routes/routes.dart';
import 'package:get/get.dart';

import 'package:flutter_filmes/app/modules/filmes/domain/entities/filmes_entity.dart';
import 'package:flutter_filmes/app/modules/filmes/presenter/controller/filmes_controller.dart';
import 'package:lottie/lottie.dart';

class FilmesPage extends GetView<FilmesController> {
  const FilmesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Container(
        color: Colors.white,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: controller.filmes.length,
                itemBuilder: (_, i) => CardFilme(filme: controller.filmes[i]),
              ),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
      onLoading: Center(
        child: SizedBox(
          width: Get.width * 0.4,
          child: Lottie.asset('assets/lottie/animation_lni17pz5.json'),
        ),
      ),
      onError: (error) => Center(
        child: Text(
          error.toString(),
        ),
      ),
    );
  }
}

class CardFilme extends StatelessWidget {
  final FilmesEntity filme;

  const CardFilme({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        height: Get.height * 0.5,
        width: Get.width * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                filme.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              height: Get.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://image.tmdb.org/t/p/original/${filme.posterPath}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => Get.toNamed(MyRoutes.filme,
                      parameters: {'id': '${filme.id}'}),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(
                        'Acessar detalhes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
