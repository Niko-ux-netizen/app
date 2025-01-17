import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:namer_app/model/movie.dart';

class SwipeCard extends StatelessWidget {
  final Movie movie;
  SwipeCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Container> cards = [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/${movie.title}.jpg'),
          fit: BoxFit.cover,
        )),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text('2'),
        color: Colors.red,
      ),
      Container(
        alignment: Alignment.center,
        child: const Text('3'),
        color: Colors.purple,
      )
    ];
    return SizedBox.expand(
      child: CardSwiper(
        cardsCount: cards.length,
        cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
            SizedBox.expand(child: cards[index]),
      ),
    );
  }
}
