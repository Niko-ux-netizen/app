import 'package:flutter/material.dart';
import 'package:namer_app/service/user_fetcher.dart';

import '../model/movie.dart';
import '../model/user.dart';
import 'rate_page.dart'; // Import the RatePage

import 'package:flutter/material.dart';
import 'package:namer_app/service/user_fetcher.dart';
import '../model/movie.dart';
import '../model/user.dart';
import 'rate_page.dart'; // Import the RatePage

import 'package:flutter/material.dart';
import 'package:namer_app/service/user_fetcher.dart';
import '../model/movie.dart';
import '../model/user.dart';
import 'rate_page.dart'; // Import the RatePage

import 'package:flutter/material.dart';
import 'package:namer_app/service/user_fetcher.dart';
import '../model/movie.dart';
import '../model/user.dart';
import 'rate_page.dart'; // Import the RatePage

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late Future<List<Movie>> _moviesToBeWatched;
  final UserService userService = UserService();
  final String userEmail = "Caann@mail.com"; // Replace with dynamic email if needed
  int? selectedMovieIndex;
  @override
  void initState() {
    super.initState();
    _moviesToBeWatched = _fetchMoviesToBeWatched();
  }

  Future<List<Movie>> _fetchMoviesToBeWatched() async {
    try {
      // Fetch the list of users
      final User user = await userService.getUserByEmail(userEmail);
      // Extract the first user from the list
      final User firstUser = user;
      print('Fetched user: $firstUser');
      // Return the history list as a List<Movie>, or an empty list if null
      return List<Movie>.from(firstUser.history ?? []);
    } catch (e) {
      print('Error fetching user or moviesToBeWatched: $e');
      throw Exception('Failed to load movies to be watched');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Movie>>(
          future: _moviesToBeWatched, // Use the movies Future
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No movies to display'));
            } else {
              final List<Movie> movieList = snapshot.data!;

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: movieList.length,
                itemBuilder: (context, index) {
                  final movie = movieList[index];
                  final isSelected = selectedMovieIndex == index;

                  return GestureDetector(
                    onTap: () {
                      // Navigate to the RatePage when a movie is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RatePage(
                            title: movie.title!, // Pass movie title to RatePage
                            image: 'assets/${movie.title}.jpg', // Pass the movie's image asset
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        // Container with BoxDecoration for movie image
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/${movie.title}.jpg'), // Assuming images are named after movie titles
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10), // Rounded corners for the container
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Container(), // Empty container to hold the background image
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  movie.title!,
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
                        // Overlay for selected movie
                        if (isSelected)
                          Positioned.fill(
                            child: Container(
                              color: Colors.black.withOpacity(0.7),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          // Call the addMovieToHistory function from UserService
                                          try {
                                            await userService.addMovieToHistory(userEmail, movie.title!);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "Nice that you watched ${movie.title}! You should review it.",
                                                ),
                                                duration: const Duration(seconds: 2),
                                              ),
                                            );
                                            Future.delayed(const Duration(seconds: 2), () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => const HistoryPage(),
                                                ),
                                              );
                                            });
                                          } catch (e) {
                                            // Handle error if necessary
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "Error adding movie to history: $e",
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        icon: const Icon(Icons.check, color: Colors.green),
                                        iconSize: 32, // Adjust icon size
                                        tooltip: 'Mark as watched',
                                      ),
                                      const SizedBox(width: 16),
                                      IconButton(
                                        onPressed: () async {
                                          // Call the removeMovieToBeWatched function from UserService
                                          try {
                                            await userService.removeMovieToBeWatched(userEmail, movie.title!);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "${movie.title} removed from watchlist",
                                                ),
                                              ),
                                            );
                                            setState(() {
                                              // Remove the movie from the watchlist locally
                                              _moviesToBeWatched = _fetchMoviesToBeWatched();
                                            });
                                          } catch (e) {
                                            // Handle error if necessary
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "Error removing movie from watchlist: $e",
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        icon: const Icon(Icons.delete, color: Colors.red),
                                        iconSize: 32, // Adjust icon size
                                        tooltip: 'Remove from watchlist',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}