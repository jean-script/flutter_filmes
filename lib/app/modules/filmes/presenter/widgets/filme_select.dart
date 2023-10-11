import 'package:flutter/material.dart';
import 'package:flutter_filmes/app/modules/filmes/presenter/controller/movie_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FilmeSelect extends GetView<MovieController> {
  const FilmeSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (ctx) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Center(
          child: SizedBox(
            width: Get.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.filme.title,
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/original/${controller.movie.backdropPath}'),
                      scale: 2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text('Media dos votos: ${controller.filme.voteAverage}'),
                const SizedBox(height: 10),
                Text(
                  controller.movie.overview,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            controller.favoriteMovie(controller.movie),
                        child: const Icon(
                          Icons.favorite_border_outlined,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onLoading: Center(
        child: SizedBox(
          width: Get.width * 0.4,
          child: Lottie.asset('assets/lottie/animation_lni17pz5.json'),
        ),
      ),
      onError: (error) => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            error.toString(),
          ),
        ),
      ),
    );
  }
}
