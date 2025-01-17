import 'package:flutter/material.dart';
import 'package:namer_app/pages/swipe_card.dart';
import 'package:namer_app/pages/swipe_card_info.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({super.key});

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SwipeCard(),
        ),
        GenreInfo()
      ]),
    ));
  }
}
