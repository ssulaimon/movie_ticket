import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstore/localstore.dart';
import 'package:movie_ticket/const/colors.dart';
import 'package:movie_ticket/models/liked_movie_model.dart';
import 'package:movie_ticket/models/movies_model.dart';
import 'package:movie_ticket/ui/book_seat_ui.dart';
import 'package:movie_ticket/widgets/custom_button.dart';

class MovieDetailsUi extends StatelessWidget {
  const MovieDetailsUi({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, MoviesModels> movieDetails = ModalRoute.of(context)!
        .settings
        .arguments! as Map<String, MoviesModels>;

    Future<void> addMovieToLiked({required LikedMovieModel movie}) async {
      var db = Localstore.instance;
      await db.collection('likedMovies').doc().set(movie.toJson());
      Get.snackbar(
        'Successful!!!',
        'Movie Added',
        backgroundColor: CustomColors.white,
        colorText: CustomColors.black,
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: CustomColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500${movieDetails['movieDetails']!.image}'))),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: CustomColors.yellow),
                        child: Text(
                          "IMDB",
                          style: TextStyle(color: CustomColors.black),
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.star,
                        color: CustomColors.gold,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        movieDetails['movieDetails']!.voteAverage.toString(),
                        style: TextStyle(color: CustomColors.gold),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(
                          onPressed: () => addMovieToLiked(
                              movie: LikedMovieModel(
                                  imageLink:
                                      "https://image.tmdb.org/t/p/w500${movieDetails['movieDetails']!.image}")),
                          icon: Icon(
                            Icons.heart_broken,
                            color: CustomColors.red,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    movieDetails['movieDetails']!.movieName,
                    style: TextStyle(
                      color: CustomColors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    movieDetails['movieDetails']!.overView,
                    style: TextStyle(
                      color: CustomColors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Cast',
                    style: TextStyle(
                      color: CustomColors.yellow,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('images/place_holder.jpg'),
                          radius: 30,
                        ),
                      ),
                      itemCount: 5,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    onTap: () => Get.to(() => const BookSeatUi()),
                    buttonTitle: 'Book Ticket',
                    color: CustomColors.gold,
                    padding: const EdgeInsets.all(20),
                    textColor: CustomColors.black,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
