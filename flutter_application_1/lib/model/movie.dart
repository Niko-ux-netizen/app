import 'dart:convert';

import 'package:namer_app/model/genre.dart';
import 'package:http/http.dart' as http;

class Movie {
  final String title;
  final List<Genre> genres;
  final String producer;
  final String description;

  Movie({
    required this.title,
    required this.genres,
    required this.producer,
    required this.description,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json['title'],
        genres: (json['genres'] as List<dynamic>)
            .map((genre) => Genre.fromJson(genre))
            .toList(),
        producer: json['producer'],
        description: json['description'],
      );

  static List<Movie> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((json) => Movie.fromJson(json)).toList();
}

Future<List<Movie>> fetchMovies() async {
  try {
    final uri = Uri.parse("http://10.0.2.2:8080/api/movies");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> moviesJson = json.decode(response.body);
      return Movie.fromJsonList(moviesJson);
    } else {
      throw Exception('Failed to load movies: ${response.statusCode}');
    }
  } catch (error) {
    print("Error fetching movies: $error");
    throw Exception('Failed to load movies');
  }
}
