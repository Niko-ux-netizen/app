import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'Movie.dart';

class MovieService {


  Future<List<Movie>> getAllMovies() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/movie'));

    if (response.statusCode == 200) {
      final List<dynamic> moviesJson = json.decode(response.body);

      // Debug: Log raw JSON response
      print('Raw JSON response: ${response.body}');

      // Parse and log movies list
      final movies = moviesJson.map((json) => Movie.fromJson(json)).toList();
      print('Parsed movies: $movies');
      return movies;
    } else {
      throw Exception('Failed to load movies: ${response.reasonPhrase}');
    }
  }

  Future<List<Movie>> getMoviesForSwipe(String email, bool allMode) async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8080/api/movie/swipe/user?email=$email&allMode=$allMode'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> moviesJson = json.decode(response.body);
      return moviesJson.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load swipe movies: ${response.reasonPhrase}');
    }
  }

  Future<List<Movie>> getAllMoviesByGenre(String genre) async {
    try {
      print("Requested Genres: ${genre}");
      HttpClient client = HttpClient();
      Uri url = Uri.parse('http://10.0.2.2:8080/api/movie/genres/all');
      HttpClientRequest request = await client.postUrl(url);
      request.headers.set('Content-Type', 'application/json; charset=UTF-8');
      request.add(utf8.encode(jsonEncode([genre])));
      HttpClientResponse response = await request.close();

      if (response.statusCode == 200) {
        String responseBody = await response.transform(utf8.decoder).join();
        print('Response body: $responseBody');

        final List<dynamic> moviesJson = json.decode(responseBody);
        return moviesJson.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies by genre: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error fetching movies by genre: $e');
    }
  }



  Future<List<Movie>> getMoviesBySomeGenres(Set<String> genres) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/movie/genres/some'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(genres.toList()),
    );

    if (response.statusCode == 200) {
      final List<dynamic> moviesJson = json.decode(response.body);
      return moviesJson.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load some genre movies: ${response.reasonPhrase}');
    }
  }

  Future<Movie> addMovie(Movie movie) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/movie'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(movie.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add movie: ${response.reasonPhrase}');
    }
  }
}
