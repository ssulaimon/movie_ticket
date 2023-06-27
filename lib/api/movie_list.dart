import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:movie_ticket/const/api_key.dart';

class MoviesFromApi {
  static Future<Map<String, dynamic>?> moviesListFromApi(
      {required String type}) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/discover/$type?include_adult=false&include_video=true&language=en-US&page=1&sort_by=popularity.desc');

    Response response = await get(url, headers: {
      "accept": "application/json",
      "Authorization": "Bearer ${ApiKey.token}"
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> movies = await jsonDecode(response.body);
      return movies;
    } else {
      log(response.statusCode.toString());
      return null;
    }
  }
}
