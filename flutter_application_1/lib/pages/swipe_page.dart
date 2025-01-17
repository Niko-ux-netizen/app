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
  final List<Movie> movies = [
    Movie(
      title: 'Inception',
      genres: [
        Genre(name: 'Science Fiction'),
        Genre(name: 'Thriller'),
        Genre(name: 'Adventure'),
      ],
      producer: 'Christopher Nolan',
      description:
          "Inception is a 2010 science fiction action film written and directed by Christopher Nolan, who also produced the film with Emma Thomas.",
    ),
    Movie(
      title: 'Interstellar',
      genres: [
        Genre(name: 'Science Fiction'),
        Genre(name: 'Horror'),
        Genre(name: 'Space'),
      ],
      producer: 'Christopher Nolan',
      description:
          "Interstellar is a 2014 epic science fiction drama film directed by Christopher Nolan, who co-wrote the screenplay with his brother Jonathan Nolan.",
    ),
    Movie(
      title: 'The Dark Knight',
      genres: [
        Genre(name: 'Action'),
        Genre(name: 'Drama'),
        Genre(name: 'Crime'),
      ],
      producer: 'Christopher Nolan',
      description:
          "The Dark Knight is a 2008 superhero film directed, produced, and co-written by Christopher Nolan.",
    ),
  ];

  int currentIndex = 0;

  void handleSwipe(int newIndex) {
    if (newIndex != null && newIndex >= 0 && newIndex < movies.length) {
      setState(() {
        currentIndex = newIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Swipe'),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SwipeCard(
                movies: movies,
                onSwipe: handleSwipe,
              ),
            ),
            GenreInfo(
              movie: movies[currentIndex],
            )
          ]),
        ));
  }
}
