import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:movie_ticket/firebase_options.dart';
import 'package:movie_ticket/ui/home_ui.dart';
import 'package:movie_ticket/ui/login_ui.dart';

class SplashScreenState extends GetxController {
  void pushTonextScreen() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await Future.delayed(const Duration(seconds: 3), () {
      if (FirebaseAuth.instance.currentUser == null) {
        Get.off(
          () => const LoginUi(),
        );
      } else {
        Get.off(
          () => const HomeUi(),
        );
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    pushTonextScreen();
  }
}
