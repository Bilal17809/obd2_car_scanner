import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'core/biding/app_biding.dart';
import '/pages/home/home.dart';
void main() {
  Get.put(ObdController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      initialBinding: ObdBinding(),
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
