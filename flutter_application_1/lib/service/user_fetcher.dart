import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/Genre.dart';
import '../model/user.dart';



class UserService {
  final String baseUrl = 'http://10.0.2.2:8080/api/user';

  // Get all users
  Future<List<User>> getAllUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> usersJson = json.decode(response.body);
      return usersJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch users: ${response.reasonPhrase}');
    }
  }

  // Get user by email
  Future<User> getUserByEmail(String email) async {
    final response = await http.get(Uri.parse('$baseUrl/email?email=$email'));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch users: ${response.reasonPhrase}');
    }
  }

  // Add a new user
  Future<User> addUser(User user) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add user: ${response.reasonPhrase}');
    }
  }

  // Add movie to history
  Future<User> addMovieToHistory(String email, String title) async {
    final response = await http.post(
      Uri.parse('$baseUrl/history?email=$email&title=$title'),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Failed to add movie to history: ${response.reasonPhrase}');
    }
  }

  // Remove movie from history
  Future<User> removeMovieFromHistory(String email, String title) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/history/remove?email=$email&title=$title'),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Failed to remove movie from history: ${response.reasonPhrase}');
    }
  }

  // Add movie to "To Be Watched"
  Future<User> addMovieToBeWatched(String email, String title) async {
    final response = await http.post(
      Uri.parse('$baseUrl/tobewatched?email=$email&title=$title'),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Failed to add movie to "To Be Watched": ${response.reasonPhrase}');
    }
  }

  // Remove movie from "To Be Watched"
  Future<User> removeMovieToBeWatched(String email, String title) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/tobewatched/remove?email=$email&title=$title'),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to remove movie from "To Be Watched": ${response
          .reasonPhrase}');
    }
  }

  // Add movie to denied list
  Future<User> addMovieToDenied(String email, String title) async {
    final response = await http.post(
      Uri.parse('$baseUrl/denied?email=$email&title=$title'),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Failed to add movie to denied list: ${response.reasonPhrase}');
    }
  }

  // Reset denied list
  Future<User> resetDeniedList(String email) async {
    final response = await http.put(
      Uri.parse('$baseUrl/denied/reset?email=$email'),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to reset denied list: ${response.reasonPhrase}');
    }
  }

  // Add genres to user
  Future<void> addGenresToUser(String email, Set<Genre> genres) async {

    final List<String> genreNames = genres.map((genre) => genre.name.toUpperCase()).toList();
    print(email);
    print(json.encode(genreNames));
    final response = await http.post(
      Uri.parse('$baseUrl/genres?email=$email'),
      // Ensure endpoint matches backend
      headers: {'Content-Type': 'application/json'},
      body: json.encode(genreNames),
    );

    if (response.statusCode == 200) {
      print("works");
    } else {


      throw Exception('Failed to add genres to user: ${response.reasonPhrase}');
    }
  }

}