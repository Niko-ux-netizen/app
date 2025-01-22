import 'package:flutter/material.dart';
import 'package:namer_app/model/movie.dart'; // Import the unified Movie model
import 'package:namer_app/pages/swipe_card_info.dart';
import 'package:namer_app/service/movie_fetcher.dart'; // Correct import for service
import 'package:namer_app/pages/swipe_card.dart'; // Assuming SwipeCard and GenreInfo exist

class SwipePage extends StatefulWidget {
  const SwipePage({super.key});

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  List<Movie> movies = [];
  int currentIndex = 0;
  String userEmail = "Caann@mail.com";
  bool allMode = false;
  final MovieService movieService = MovieService();

  @override
  void initState() {
    super.initState();
    _fetchMovies(); // Fetch movies once at the start
  }
  Future<void> _fetchMovies() async {
    final fetchedMovies =
    await movieService.getMoviesForSwipe(userEmail, allMode);
    setState(() {
      movies = fetchedMovies;
    });
  }

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