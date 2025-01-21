import 'package:flutter/material.dart';

class GenresForSwipe extends StatefulWidget {
  const GenresForSwipe({super.key});

  @override
  _GenresForSwipeState createState() => _GenresForSwipeState();
}

class _GenresForSwipeState extends State<GenresForSwipe> {
  final List<Map<String, dynamic>> genres = [
    {'title': 'Action', 'isActive': false},
    {'title': 'Adventure', 'isActive': false},
    {'title': 'Animation', 'isActive': false},
    {'title': 'Biography', 'isActive': false},
    {'title': 'Comedy', 'isActive': false},
    {'title': 'Crime', 'isActive': false},
    {'title': 'Documentary', 'isActive': false},
    {'title': 'Drama', 'isActive': false},
    {'title': 'Family', 'isActive': false},
    {'title': 'Fantasy', 'isActive': false},
    {'title': 'History', 'isActive': false},
    {'title': 'Horror', 'isActive': false},
    {'title': 'Musical', 'isActive': false},
    {'title': 'Mystery', 'isActive': false},
    {'title': 'Romance', 'isActive': false},
    {'title': 'Science Fiction', 'isActive': false},
    {'title': 'Sport', 'isActive': false},
    {'title': 'Thriller', 'isActive': false},
    {'title': 'War', 'isActive': false},
    {'title': 'Western', 'isActive': false},
  ];

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
        child: ListView.builder(
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
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
