import 'package:flutter/material.dart';
import 'package:namer_app/pages/rate_page.dart';

class GenreTappedPage extends StatelessWidget {
  final String genreTitle;

  const GenreTappedPage({super.key, required this.genreTitle});

  @override
  Widget build(BuildContext context) {
    // Define the movies with titles
    final movies = [
      {'title': 'Interstellar', 'image': 'assets/interstellar.jpg'},
      {'title': 'Everything Everywhere All At Once', 'image': 'assets/everything_everywhere.jpg'},
      {'title': 'Avatar: The Way of Water', 'image': 'assets/avatar.jpeg'},
      {'title': 'Top Gun: Maverick', 'image': 'assets/top_gun.jpg'},
      {'title': 'Oppenheimer', 'image': 'assets/oppenheimer.jpg'},
      {'title': 'Inside Out', 'image': 'assets/inside_out.jpg'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(genreTitle), // Display the genreTitle
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 2 / 3, // Adjust card size
                ),
                itemCount: movies.length, // Number of items in the list
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RatePage(
                            title: movie['title']!,
                            image: movie['image']!,
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
                              child: Image.asset(
                                movie['image']!, // Movie image
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              movie['title']!, // Movie title
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
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
