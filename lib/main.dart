import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket/state/package_dependency.dart';
import 'package:movie_ticket/ui/splash_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: const SplashUi(),
      initialBinding: PackageDepency(),
    ),
  );
}
