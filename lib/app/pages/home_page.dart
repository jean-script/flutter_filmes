import 'package:flutter/material.dart';
import 'package:flutter_filmes/app/modules/filmes/presenter/widgets/filmes_page.dart';
import 'package:flutter_filmes/app/routes/routes.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                onTap: () => Get.offNamedUntil(MyRoutes.home, (route) => false),
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
                  Get.offNamedUntil(MyRoutes.favorito, (route) => false),
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
      body: const FilmesPage(),
    );
  }
}
