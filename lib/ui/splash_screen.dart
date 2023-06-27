import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket/const/colors.dart';
import 'package:movie_ticket/state/splash_screen_state.dart';

class SplashUi extends StatelessWidget {
  const SplashUi({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashScreenState>();
    return Scaffold(
      backgroundColor: CustomColors.black,
      body: Center(
        child: Image.asset(
          'images/splash_image.png',
        ),
      ),
    );
  }
}
