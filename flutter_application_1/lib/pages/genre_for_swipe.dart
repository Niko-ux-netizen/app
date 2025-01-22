import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Make sure to import your UserService class here

import '../model/Genre.dart';
import '../model/user.dart';
import '../service/user_fetcher.dart';

class GenresForSwipe extends StatefulWidget {
  const GenresForSwipe({super.key});
  @override
  _GenresForSwipeState createState() => _GenresForSwipeState();
}

class _GenresForSwipeState extends State<GenresForSwipe> {
  // Define the genres list
  final List<Map<String, dynamic>> genres = [
    {'title': 'action', 'isActive': false},
    {'title': 'adventure', 'isActive': false},
    {'title': 'animation', 'isActive': false},
    {'title': 'biography', 'isActive': false},
    {'title': 'comedy', 'isActive': false},
    {'title': 'crime', 'isActive': false},
    {'title': 'documentary', 'isActive': false},
    {'title': 'drama', 'isActive': false},
    {'title': 'family', 'isActive': false},
    {'title': 'fantasy', 'isActive': false},
    {'title': 'history', 'isActive': false},
    {'title': 'horror', 'isActive': false},
    {'title': 'musical', 'isActive': false},
    {'title': 'mystery', 'isActive': false},
    {'title': 'romance', 'isActive': false},
    {'title': 'science fiction', 'isActive': false},
    {'title': 'sport', 'isActive': false},
    {'title': 'thriller', 'isActive': false},
    {'title': 'war', 'isActive': false},
    {'title': 'western', 'isActive': false},
  ];

  String userEmail = 'Caann@mail.com';
  late Future<User> _user;
  late Set<String> favoriteGenres;

  @override
  void initState() {
    super.initState();
    _user = fetchUser(userEmail);
  }

  Future<User> fetchUser(String email) async {
    final UserService userService = UserService();
    try {
      User user = await userService.getUserByEmail(email);
        print(user.favoriteGenres);
        setState(() {
          favoriteGenres = user.favoriteGenres;
          for (var genre in genres) {
            genre['isActive'] = favoriteGenres.map((g) => g.toLowerCase().replaceAll('_', ' ')).contains(genre['title']);
          }
        });
        return user;
    } catch (e) {
      throw Exception('Failed to load user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Genres'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<User>(
                future: _user, // Use the Future to display data after it's fetched
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    // If user data is available, show the genres
                    return ListView.builder(
                      itemCount: genres.length,
                      itemBuilder: (context, index) {
                        final genre = genres[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: genre['isActive'] ? Colors.green : Colors.grey,
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                genre['isActive'] = !genre['isActive'];
                              });
                            },
                            child: Text(
                              genre['title']!,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('No data available'));
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Collect selected genres as Genre objects
                Set<Genre> selectedGenres = genres
                    .where((genre) => genre['isActive'] == true)
                    .map((genre) => Genre.fromJson({'name': genre['title']})) // Use Genre.fromJson here
                    .toSet();

                if (selectedGenres.isNotEmpty) {
                  // Send genres to the backend
                  UserService().addGenresToUser(userEmail, selectedGenres);
                } else {
                  // Show a message if no genres are selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select at least one genre')),
                  );
                }
              },
              child: const Text('Submit Selected Genres'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
