import 'package:flutter/material.dart';
import 'package:movie_ticket/const/colors.dart';
import 'package:movie_ticket/ui/feeds_ui.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black,
      body: const SafeArea(
        child: FeedsUi(),
      ),
    );
  }
}
