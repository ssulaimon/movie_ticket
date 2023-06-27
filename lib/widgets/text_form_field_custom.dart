import 'package:flutter/material.dart';
import 'package:movie_ticket/const/colors.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;
  final Icon? prefixIcon;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  const CustomTextForm({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.textEditingController,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textEditingController,
      style: TextStyle(
        color: CustomColors.white,
      ),
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            color: CustomColors.white,
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: CustomColors.red,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: CustomColors.yellow,
          )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: CustomColors.yellow,
          ))),
    );
  }
}
