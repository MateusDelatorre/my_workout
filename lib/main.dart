import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_workout/presentation/test.dart';
import 'package:my_workout/presentation/workout/workout_list/view/workout_list_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => TestPage()),
      GetPage(name: '/second', page: () => Container()),
      GetPage(
          name: '/third',
          page: () => Container(),
      ),
    ],
  )
  );
}