import 'package:movie_ticket/models/movies_model.dart';

class TvModel extends MoviesModels {
  TvModel(
      {required super.movieName,
      required super.image,
      required super.overView,
      required super.voteAverage,
      required super.voteCount});

  factory TvModel.fromJson({required Map<String, dynamic> json}) {
    return TvModel(
        movieName: json['name'],
        image: json['poster_path'],
        overView: json['overview'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }
}
