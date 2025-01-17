import 'package:namer_app/model/genre.dart';

class Movie {
  final String title;
  final List<Genre> genres;
  final String producer;
  final String description;

  Movie(
      {required this.title,
      required this.genres,
      required this.producer,
      required this.description});
}
