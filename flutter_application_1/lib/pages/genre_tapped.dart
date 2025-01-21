import 'package:flutter/material.dart';
import 'package:namer_app/pages/rate_page.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:namer_app/pages/rate_page.dart';

import '../service/Movie.dart';
import '../service/movie_fetcher.dart';

class GenreTappedPage extends StatefulWidget {
  final String genreTitle;

  const GenreTappedPage({super.key, required this.genreTitle});
  @override
  _GenreTappedPageState createState() => _GenreTappedPageState();
}

class _GenreTappedPageState extends State<GenreTappedPage> {
  late Future<List<Movie>> _moviesByGenre;
  final MovieService movieService = MovieService();

  @override
  void initState() {
    super.initState();
    _moviesByGenre = movieService.getAllMovies();

    // Debug: Log the Future for movies
    _moviesByGenre.then((movies) {
      print('Fetched movies: $movies');
    }).catchError((error) {
      print('Error fetching movies: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.genreTitle),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Movie>>(
        future: _moviesByGenre,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Snapshot error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            print('No movies found');
            return const Center(child: Text('No movies found'));
          }

          // Debug: Log the movies data
          final movies = snapshot.data!;
          print('Movies in FutureBuilder: $movies');

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 2 / 3,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RatePage(
                          title: movie.title,
                          image: movie.image ?? 'https://via.placeholder.com/150',
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          child: Image.network(
                            movie.image ?? 'https://via.placeholder.com/150', // Use placeholder if image is null
                            fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                print('Image load error: $error');
                                return const Center(
                                  child: Icon(Icons.error, color: Colors.red),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            movie.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}