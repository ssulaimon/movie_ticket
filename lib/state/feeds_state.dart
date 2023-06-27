// ignore_for_file: unnecessary_cast

import 'dart:io';

import 'package:get/get.dart';
import 'package:movie_ticket/api/movie_list.dart';
import 'package:movie_ticket/models/movies_model.dart';
import 'package:movie_ticket/models/tv_model.dart';

class FeedsState extends GetxController {
  Rx<List<MoviesModels>?> movies = (null as List<MoviesModels>?).obs;
  Rx<List<TvModel>?> tv = (null as List<TvModel>?).obs;
  Rx<File?> file = (null as File?).obs;

  void updateImage({required File image}) {
    file.value = image;
    update();
  }

  void getMoviesList() async {
    Map<String, dynamic>? getMovieList =
        await MoviesFromApi.moviesListFromApi(type: "movie");
    Map<String, dynamic>? getTvList =
        await MoviesFromApi.moviesListFromApi(type: "tv");

    if (getMovieList != null && getTvList != null) {
      List result = await getMovieList['results'];
      movies.value = List.generate(
          result.length, (index) => MoviesModels.fromJson(json: result[index]));
      List resultTv = await getTvList['results'];
      tv.value = List.generate(
          resultTv.length, (index) => TvModel.fromJson(json: resultTv[index]));
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getMoviesList();
  }
}
