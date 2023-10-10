import 'package:flutter/material.dart';
import 'package:flutter_filmes/app/modules/filmes/presenter/controller/movie_controller.dart';
import 'package:flutter_filmes/app/modules/filmes/presenter/widgets/filme_select.dart';
import 'package:flutter_filmes/app/routes/routes.dart';
import 'package:get/get.dart';

class FilmeSelectPage extends GetView<MovieController> {
  const FilmeSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Get.offAllNamed(MyRoutes.home);
                },
                child: const Text(
                  'Prime Flix',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () =>
                  Get.offAllNamed(MyRoutes.favorito),
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white)),
              child: const Text(
                'Meus favoritos',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
      body: const FilmeSelect(),
    );
  }
}
