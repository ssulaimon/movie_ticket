import 'package:get/get.dart';
import 'package:movie_ticket/state/feeds_state.dart';
import 'package:movie_ticket/state/login_state.dart';
import 'package:movie_ticket/state/register_state.dart';
import 'package:movie_ticket/state/splash_screen_state.dart';

class PackageDepency implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashScreenState(),
    );
    Get.lazyPut(() => LoginState());
    Get.lazyPut(() => RegisterState());
    Get.lazyPut(() => FeedsState());
  }
}
