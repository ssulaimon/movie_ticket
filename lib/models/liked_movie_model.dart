class LikedMovieModel {
  String imageLink;
  LikedMovieModel({
    required this.imageLink,
  });

  Map<String, String> toJson() => {
        "image": imageLink,
      };
}
