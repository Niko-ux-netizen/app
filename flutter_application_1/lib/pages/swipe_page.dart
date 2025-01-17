import 'package:flutter/material.dart';
import 'package:namer_app/model/genre.dart';
import 'package:namer_app/model/movie.dart';
import 'package:namer_app/pages/swipe_card.dart';
import 'package:namer_app/pages/swipe_card_info.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({super.key});

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  Movie dummyMovie = Movie(
    title: 'Interstellar',
    genres: [
      Genre(name: 'Science Fiction'),
      Genre(name: 'Horror'),
      Genre(name: 'Space'),
    ],
    producer: 'Christopher Nolan',
    description:
        "Hallo Anthonny en Nikolai, alles goed met jullie? Ik heb mijn best gedaan op deze pagina en chatGPT heeft mij goed kunne helpen, danku!",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SwipeCard(movie: dummyMovie),
        ),
        GenreInfo(
          movie: dummyMovie,
        )
      ]),
    ));
  }
}
