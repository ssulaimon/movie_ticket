import 'package:flutter/widgets.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:movie_ticket/const/colors.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalWeekCalendar(
      monthColor: CustomColors.grey,
      activeNavigatorColor: CustomColors.grey,
      inactiveNavigatorColor: CustomColors.grey,
      inactiveBackgroundColor: CustomColors.dateColor,
      inactiveTextColor: CustomColors.black,
      activeBackgroundColor: CustomColors.yellow,
      disabledBackgroundColor: CustomColors.dateColor,
      weekStartFrom: WeekStartFrom.Monday,
      activeTextColor: CustomColors.black,
      onDateChange: (date) {},
    );
  }
}
