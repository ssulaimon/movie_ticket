import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterState extends GetxController {
  RxBool loading = false.obs;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

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

  String? passwordValidator(String? text) {
    if (text!.isEmpty) {
      return 'Please enter your account password';
    } else if (text.length < 6) {
      return 'Password is not Strong';
    } else {
      return null;
    }
  }

  String? nameValidator(String? text) {
    if (text!.isEmpty) {
      return 'Please enter your account name';
    } else if (text.length < 5) {
      return 'name is too short ';
    } else {
      return null;
    }
  }

  void isLoading({required bool loader}) {
    loading(loader);
  }
}
