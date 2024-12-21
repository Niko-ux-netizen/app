import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwipeCard extends StatelessWidget {
  List<Container> cards = [
    Container(
      alignment: Alignment.center,
      child: const Text('1'),
      color: Colors.blue,
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

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CardSwiper(
        cardsCount: cards.length,
        cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
            SizedBox.expand(child: cards[index]),
      ),
    );
  }
}
