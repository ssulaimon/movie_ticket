import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket/authentication/email_authentication.dart';
import 'package:movie_ticket/const/colors.dart';
import 'package:movie_ticket/state/register_state.dart';
import 'package:movie_ticket/widgets/custom_button.dart';
import 'package:movie_ticket/widgets/text_form_field_custom.dart';

class RegisterUi extends StatelessWidget {
  const RegisterUi({super.key});

  @override
  Widget build(BuildContext context) {
    var registerState = Get.put(RegisterState());

    void createAccount() async {
      if (registerState.key.currentState!.validate()) {
        registerState.isLoading(loader: true);
        await Future.delayed(const Duration(seconds: 3));
        EmailAuthentication authenticate = EmailAuthentication(
            email: registerState.email.text,
            password: registerState.password.text,
            name: registerState.name.text);
        await authenticate.createAccount();
        registerState.isLoading(
          loader: false,
        );
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: CustomColors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Form(
          key: registerState.key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextForm(
                textEditingController: registerState.name,
                validator: (text) => registerState.nameValidator(text),
                hintText: 'Full Name',
                prefixIcon: Icon(
                  Icons.person,
                  color: CustomColors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextForm(
                textEditingController: registerState.email,
                validator: (text) => registerState.emailValidator(text),
                hintText: 'Email',
                prefixIcon: Icon(
                  Icons.mail,
                  color: CustomColors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextForm(
                validator: (text) => registerState.passwordValidator(text),
                textEditingController: registerState.password,
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.key,
                  color: CustomColors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onTap: () => createAccount(),
                buttonTitle: 'Create Account',
                color: CustomColors.yellow,
                padding: const EdgeInsets.all(20),
                textColor: CustomColors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() => registerState.loading.value == true
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
