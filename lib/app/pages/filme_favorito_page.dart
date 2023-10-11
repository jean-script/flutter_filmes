import 'package:flutter/material.dart';
import 'package:flutter_filmes/app/routes/routes.dart';
import 'package:get/get.dart';

class MovieFavoritePage extends StatelessWidget {
  const MovieFavoritePage({super.key});

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
                onTap: () => Get.offAllNamed(MyRoutes.home),
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
              onPressed: () => Get.offAllNamed(MyRoutes.favorito),
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
      body: const SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
                child: Column(
                  children: [
                    Text('Filmes favoritos'),
                    Text('Pagina sendo construida'),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
