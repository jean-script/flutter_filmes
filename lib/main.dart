import 'package:flutter/material.dart';
import 'package:flutter_filmes/app/binder/initial_bindinds.dart';
import 'package:flutter_filmes/app/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();

    runApp(const MyApp());
  } catch (e) {
    runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: InitialBindings(),
        home: Container(
            child: Center(
          child: Text(
            e.toString(),
            textAlign: TextAlign.center,
          ),
        )),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: MyRoutes.pages,
      initialBinding: InitialBindings(),
    );
  }
}
