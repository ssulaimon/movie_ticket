import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket/authentication/email_authentication.dart';
import 'package:movie_ticket/const/colors.dart';
import 'package:movie_ticket/state/reset_password_state.dart';
import 'package:movie_ticket/widgets/custom_button.dart';
import 'package:movie_ticket/widgets/text_form_field_custom.dart';

class ResetPasswordUi extends StatelessWidget {
  const ResetPasswordUi({super.key});

  @override
  Widget build(BuildContext context) {
    var resetPasswordState = Get.put(ResetPasswordState());
    void resetpassword() async {
      if (resetPasswordState.key.currentState!.validate()) {
        resetPasswordState.isLoading(loader: true);
        Future.delayed(const Duration(seconds: 3));
        EmailAuthentication emailAuthentication = EmailAuthentication(
            email: resetPasswordState.email.text, password: '');

        await emailAuthentication.sendResetPassword();
        resetPasswordState.isLoading(loader: false);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: CustomColors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Form(
          key: resetPasswordState.key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextForm(
                validator: (text) => resetPasswordState.emailValidator(text),
                textEditingController: resetPasswordState.email,
                hintText: 'Account Email',
                prefixIcon: Icon(
                  Icons.email,
                  color: CustomColors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: () => resetpassword(),
                buttonTitle: 'Send Link',
                color: CustomColors.yellow,
                padding: const EdgeInsets.all(20),
                textColor: CustomColors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() => resetPasswordState.loading.value == true
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
