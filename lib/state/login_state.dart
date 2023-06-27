import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginState extends GetxController {
  RxBool loading = false.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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

  void isLoading({required bool loader}) {
    loading(loader);
  }
}
