import 'package:flutter/material.dart';
import 'package:namer_app/pages/rate_page.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:namer_app/pages/rate_page.dart';

import 'package:namer_app/model/movie.dart';
import '../service/movie_fetcher.dart';

import 'package:flutter/material.dart';
import 'package:namer_app/pages/rate_page.dart';
import 'package:namer_app/model/movie.dart';
import 'package:namer_app/service/movie_fetcher.dart';

class GenreTappedPage extends StatefulWidget {
  final Set<String> genreTitle;

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
    _moviesByGenre = movieService.getMoviesBySomeGenres(widget.genreTitle);
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
        title: Text(widget.genreTitle.isEmpty ? 'All Movies' : widget.genreTitle.join(', ')),
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
                            child: Image.asset(
                              'assets/${movie.title}.jpg', // Load image from assets
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
