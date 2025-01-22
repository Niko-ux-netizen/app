import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:namer_app/model/movie.dart';
import 'package:namer_app/service/user_fetcher.dart';

import '../service/movie_fetcher.dart';


class SwipeCard extends StatelessWidget {
  final List<Movie> movies;
  final Function(int) onSwipe;

  const SwipeCard({
    Key? key,
    required this.movies,
    required this.onSwipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userEmail = "Caann@mail.com";
    final UserService userService = UserService();

    return SizedBox.expand(
      child: CardSwiper(
        cardsCount: movies.length,
        onSwipe: (previousIndex, newIndex, direction) async {
          final movie = movies[previousIndex];
          if (direction == CardSwiperDirection.left) {
            print("Swiped to left: Adding movie to 'To Be denied'");
            await userService.addMovieToDenied(userEmail, movie.title);
          } else if (direction == CardSwiperDirection.right) {
            print("Swiped to right: Adding movie to 'to be watched'");
            await userService.addMovieToBeWatched(userEmail, movie.title);

          }
          if (newIndex != null) {
            onSwipe(newIndex);
          }
          return true;
        },
        cardBuilder: (context, index, horizontalOffsetPercentage,
            verticalOffsetPercentage) {
          final movie = movies[index];

          double offset = horizontalOffsetPercentage.toDouble();

          double opacity = (offset.abs()) / 1000;
          opacity = opacity.clamp(0.0, 1.0);
          print("Calculated opacity: $opacity");

          Color overlayColor = Colors.transparent;
          if (offset > 0) {
            overlayColor = Colors.green.withOpacity(opacity);

          } else if (offset < 0) {
            overlayColor = Colors.red.withOpacity(opacity);
          }

          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/${movie.title}.jpg'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8.0,
                      spreadRadius: 2.0,
                      offset: Offset(2.0, 4.0),
                    ),
                  ],
                ),
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(16.0),
              ),
              Container(
                color: overlayColor,
              ),
            ],
          );
        },
        allowedSwipeDirection:
        AllowedSwipeDirection.only(left: true, right: true),
      ),
    );
  }
}