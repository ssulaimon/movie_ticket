class MoviesModels {
  String movieName;
  String overView;
  dynamic voteAverage;
  dynamic voteCount;
  String image;

  MoviesModels(
      {required this.movieName,
      required this.image,
      required this.overView,
      required this.voteAverage,
      required this.voteCount});

  factory MoviesModels.fromJson({required Map<String, dynamic> json}) {
    return MoviesModels(
        movieName: json['title'],
        image: json['poster_path'],
        overView: json['overview'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }
}
