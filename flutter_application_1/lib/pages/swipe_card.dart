import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:namer_app/model/movie.dart';

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
    return SizedBox.expand(
      child: CardSwiper(
        cardsCount: movies.length,
        onSwipe: (previousIndex, newIndex, direction) {
          if (newIndex != null) {
            onSwipe(newIndex);
          }
          return true;
        },
        cardBuilder: (context, index, horizontalThreshold, verticalThreshold) {
          final movie = movies[index];
          return Container(
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
          );
        },
      ),
    );
  }
}
