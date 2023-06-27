import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket/authentication/email_authentication.dart';
import 'package:movie_ticket/const/colors.dart';
import 'package:movie_ticket/state/feeds_state.dart';
import 'package:movie_ticket/ui/movie_details_ui.dart';
import 'package:movie_ticket/widgets/category_selector.dart';
import 'package:movie_ticket/widgets/search_widget.dart';
import 'package:image_picker/image_picker.dart';

class FeedsUi extends StatelessWidget {
  const FeedsUi({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = EmailAuthentication.userName;
    var api = Get.find<FeedsState>();
    File? file;

    Future<void> chooseImage() async {
      ImagePicker imagePicker = ImagePicker();
      XFile? xfile = await imagePicker.pickImage(source: ImageSource.camera);
      if (xfile != null) {}
      api.updateImage(image: File(xfile!.path));
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome $userName',
                style: TextStyle(
                  color: CustomColors.yellow,
                  fontSize: 15,
                ),
              ),
              Obx(() => GestureDetector(
                    onTap: () async => await chooseImage(),
                    child: CircleAvatar(
                      backgroundColor:
                          api.file.value == null ? CustomColors.white : null,
                      backgroundImage: api.file.value != null
                          ? FileImage(api.file.value!)
                          : null,
                      radius: 20,
                    ),
                  ))
            ],
          ),
          Text(
            'Let relax and watch movie...',
            style: TextStyle(
              color: CustomColors.grey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SearchWidget(),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Categories",
            style: TextStyle(
              color: CustomColors.white,
            ),
          ),
          Expanded(
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CategorySelector(
                        title: 'Action',
                      ),
                      CategorySelector(
                        title: 'Comedy',
                      ),
                      CategorySelector(
                        title: 'Romance',
                      ),
                      CategorySelector(
                        title: 'Thriller',
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Latest Movies',
                style: TextStyle(
                  color: CustomColors.white,
                ),
              ),
              SizedBox(
                  height: 220,
                  child: Obx(() => api.movies.value == null
                      ? ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                              child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: AssetImage('images/place_holder.jpg'),
                                  fit: BoxFit.fill,
                                )),
                            height: 200,
                            width: 150,
                          )),
                        )
                      : ListView.builder(
                          itemCount: api.movies.value!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Get.to(() => const MovieDetailsUi(),
                                arguments: {
                                  "movieDetails": api.movies.value![index],
                                }),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${api.movies.value![index].image}',
                                    ),
                                    fit: BoxFit.fill,
                                  )),
                              height: 200,
                              width: 150,
                            ),
                          ),
                        ))),
              Text(
                'TV Series',
                style: TextStyle(
                  color: CustomColors.white,
                ),
              ),
              SizedBox(
                  height: 220,
                  child: Obx(() => api.tv.value == null
                      ? ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                              child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: AssetImage('images/place_holder.jpg'),
                                  fit: BoxFit.fill,
                                )),
                            height: 200,
                            width: 150,
                          )),
                        )
                      : ListView.builder(
                          itemCount: api.movies.value!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Get.to(() => const MovieDetailsUi(),
                                arguments: {
                                  "movieDetails": api.tv.value![index],
                                }),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${api.tv.value![index].image}',
                                    ),
                                    fit: BoxFit.fill,
                                  )),
                              height: 200,
                              width: 150,
                            ),
                          ),
                        ))),
            ]),
          )
        ],
      ),
    );
  }
}
