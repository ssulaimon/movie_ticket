import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket/authentication/email_authentication.dart';
import 'package:movie_ticket/const/colors.dart';
import 'package:movie_ticket/state/login_state.dart';
import 'package:movie_ticket/ui/home_ui.dart';
import 'package:movie_ticket/ui/register_ui.dart';
import 'package:movie_ticket/ui/reset_password_ui.dart';
import 'package:movie_ticket/widgets/text_form_field_custom.dart';
import 'package:movie_ticket/widgets/custom_button.dart';

class LoginUi extends StatelessWidget {
  const LoginUi({super.key});

  @override
  Widget build(BuildContext context) {
    var loginState = Get.find<LoginState>();
    void loginToAccount() async {
      if (loginState.key.currentState!.validate()) {
        loginState.isLoading(loader: true);
        await Future.delayed(const Duration(seconds: 3));
        EmailAuthentication emailAuthentication = EmailAuthentication(
          email: loginState.email.text,
          password: loginState.password.text,
        );
        User? user = await emailAuthentication.loginToAccount();
        if (user != null) {
          loginState.isLoading(loader: false);
          Get.off(() => const HomeUi());
        } else {
          loginState.isLoading(loader: false);
        }
      }
    }

    return Scaffold(
      backgroundColor: CustomColors.black,
      body: Form(
        key: loginState.key,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextForm(
                validator: (text) => loginState.emailValidator(text),
                textEditingController: loginState.email,
                hintText: 'Email',
                prefixIcon: Icon(Icons.email, color: CustomColors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextForm(
                validator: (text) => loginState.passwordValidator(text),
                hintText: 'Password',
                textEditingController: loginState.password,
                prefixIcon: Icon(
                  Icons.key,
                  color: CustomColors.white,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Get.to(() => const ResetPasswordUi()),
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      color: CustomColors.yellow,
                    ),
                  ),
                ),
              ),
              CustomButton(
                onTap: () => loginToAccount(),
                buttonTitle: 'Login',
                padding: const EdgeInsets.all(20),
                color: CustomColors.yellow,
                textColor: CustomColors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                onTap: () => Get.to(() => const RegisterUi()),
                buttonTitle: 'Create Account',
                padding: const EdgeInsets.all(20),
                color: CustomColors.yellow,
                textColor: CustomColors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() => loginState.loading.value == true
                  ? CircularProgressIndicator(
                      color: CustomColors.white,
                    )
                  : const SizedBox())
            ],
          ),
        ),
      ),
    );
  }
}
