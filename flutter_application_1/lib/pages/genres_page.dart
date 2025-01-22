import 'package:flutter/material.dart';
import 'package:namer_app/pages/genre_tapped.dart';

class GenresPage extends StatelessWidget {
  const GenresPage({super.key});

  @override
  Widget build(BuildContext context) {
    final genres = [
      {'title': "ACTION", 'image': 'assets/Mad Max Fury Road.jpg'},
      {'title': "ADVENTURE", 'image': 'assets/Jurassic Park.jpg'},
      {'title': "ANIMATION", 'image': 'assets/Frozen.jpg'},
      {'title': "BIOGRAPHY", 'image': 'assets/The Social Network.jpg'},
      {'title': "COMEDY", 'image': 'assets/Toy Story.jpg'},
      {'title': "CRIME", 'image': 'assets/The Dark Knight.jpg'},
      {'title': "DRAMA", 'image': 'assets/The Revenant.jpg'},
      {'title': "FAMILY", 'image': 'assets/Coco.jpg'},
      {'title': "FANTASY", 'image': 'assets/Avatar.jpg'},
      {'title': "MUSICAL", 'image': 'assets/Coco.jpg'},
      {'title': "ROMANCE", 'image': 'assets/Titanic.jpg'},
      {'title': "SCIENCE_FICTION", 'image': 'assets/Black Panther.jpg'},
      {'title': "THRILLER", 'image': 'assets/Inception.jpg'},
      {'title': "WAR", 'image': 'assets/Inglourious Basterds.jpg'},
      {'title': "WESTERN", 'image': 'assets/Django Unchained.jpg'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find by genres'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: genres.length,
                itemBuilder: (context, index) {
                  final genre = genres[index];
                  return GestureDetector(
                    onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GenreTappedPage(
                                genreTitle: Set<String>.from([genre['title']!]),
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
                              genre['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            genre['title']!,
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
