import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_ticket/const/api_key.dart';

class BackendService {
  static Future<List<Map<String, dynamic>>> getSuggestions(
      {required String query}) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc');
    Response response = await get(url, headers: {
      "accept": "application/json",
      "Authorization": "Bearer ${ApiKey.token}",
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> result = await jsonDecode(response.body);
      List movieList = await result['results'];
      return List.generate(movieList.length,
          (index) => {"name": movieList[index]['original_title']});
    } else {
      return List.generate(3, (index) => {"name": "error"});
    }
  }
}
