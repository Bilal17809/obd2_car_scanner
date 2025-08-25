import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/pages/splash/view/splash_view.dart';
import 'core/dependency_inject/dependency_inject.dart';

void main() {
  DependencyInject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      home:SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
