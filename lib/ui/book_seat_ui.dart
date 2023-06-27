import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket/const/colors.dart';
import 'package:movie_ticket/widgets/custom_button.dart';
import 'package:movie_ticket/widgets/date_picker_widget.dart';

class BookSeatUi extends StatelessWidget {
  const BookSeatUi({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> seats = [3, 5, 9, 10, 20];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.black,
        elevation: 0.0,
      ),
      backgroundColor: CustomColors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            'Seats',
            style: TextStyle(
              color: CustomColors.white,
            ),
          )),
          const SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: SizedBox(
              height: 206,
              child: GridView.builder(
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemBuilder: (context, index) => IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        const AssetImage(
                          'images/chair.png',
                        ),
                        color: seats.contains(index)
                            ? CustomColors.gold
                            : CustomColors.grey,
                      ))),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 5,
                  backgroundColor: CustomColors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Available',
                  style: TextStyle(color: CustomColors.white),
                ),
                const SizedBox(
                  width: 30,
                ),
                CircleAvatar(
                  radius: 5,
                  backgroundColor: CustomColors.gold,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Reserved',
                  style: TextStyle(color: CustomColors.white),
                ),
                const SizedBox(
                  width: 30,
                ),
                CircleAvatar(
                  radius: 5,
                  backgroundColor: CustomColors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Selected',
                  style: TextStyle(color: CustomColors.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              'Select Date',
              style: TextStyle(
                color: CustomColors.white,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: DatePickerWidget(),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              'Select Time',
              style: TextStyle(
                color: CustomColors.white,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: CustomColors.dateColor,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Text(
                    '11:30AM',
                    style: TextStyle(
                      color: CustomColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColors.dateColor,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Text(
                    '02:30AM',
                    style: TextStyle(
                      color: CustomColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomColors.dateColor,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Text(
                    '05:30AM',
                    style: TextStyle(
                      color: CustomColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            onTap: () => Get.to(() => const BookSeatUi()),
            buttonTitle: 'Buy Ticket',
            color: CustomColors.gold,
            padding: const EdgeInsets.all(20),
            textColor: CustomColors.black,
          )
        ],
      ),
    );
  }
}
