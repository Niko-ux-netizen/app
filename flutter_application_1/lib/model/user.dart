import 'genre.dart';
import 'movie.dart';

class User {
  final int id;
  final String username;
  final String email;
  final DateTime dateOfBirth;
  final List<Movie> history;
  final List<Movie> moviesToBeWatched;
  final List<Movie> deniedMovies;
  final Set<String> favoriteGenres;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.dateOfBirth,
    required this.history,
    required this.moviesToBeWatched,
    required this.deniedMovies,
    required this.favoriteGenres,
  });

  // Factory constructor for JSON deserialization
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      history: (json['history'] as List<dynamic>?)
          ?.map((movieJson) => Movie.fromJson(movieJson))
          .toList() ?? [],
      moviesToBeWatched: (json['moviesToBeWatched'] as List<dynamic>?)
          ?.map((movieJson) => Movie.fromJson(movieJson))
          .toList() ?? [],
      deniedMovies: (json['deniedMovies'] as List<dynamic>?)
          ?.map((movieJson) => Movie.fromJson(movieJson))
          .toList() ?? [],
      favoriteGenres: (json['favoriteGenres'] as List<dynamic>?)
          ?.map((genre) => genre.toString())
          .toSet() ?? {},
    );
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'history': history.map((movie) => movie.toJson()).toList(),
      'moviesToBeWatched': moviesToBeWatched.map((movie) => movie.toJson()).toList(),
      'deniedMovies': deniedMovies.map((movie) => movie.toJson()).toList(),
      'favoriteGenres': favoriteGenres.toList()
    };
  }
}
