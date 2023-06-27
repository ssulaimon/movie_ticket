import 'package:flutter/widgets.dart';
import 'package:movie_ticket/const/colors.dart';

class CategorySelector extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const CategorySelector({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: CustomColors.white, borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        style: TextStyle(
          color: CustomColors.black,
        ),
      ),
    );
  }
}
