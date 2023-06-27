import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ResetPasswordState extends GetxController {
  RxBool loading = false.obs;

  TextEditingController email = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  String? emailValidator(String? text) {
    if (text!.isEmpty) {
      return 'Please enter your email account';
    } else if (!text.contains('@')) {
      return 'Unknown email domain';
    } else {
      return null;
    }
  }

  void isLoading({required bool loader}) {
    loading(loader);
  }
}
