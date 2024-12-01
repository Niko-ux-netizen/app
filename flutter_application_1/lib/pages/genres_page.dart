import 'package:flutter/material.dart';
import 'package:namer_app/pages/genre_tapped.dart';

class GenresPage extends StatelessWidget {
  const GenresPage({super.key});

  @override
  Widget build(BuildContext context) {
    final genres = [
      {'title': 'Fiction', 'image': 'assets/interstellar.jpg'},
      {'title': 'Comedy', 'image': 'assets/everything_everywhere.jpg'},
      {'title': 'Aliens', 'image': 'assets/avatar.jpeg'},
      {'title': 'Action', 'image': 'assets/top_gun.jpg'},
      {'title': 'Based On Real Stories', 'image': 'assets/oppenheimer.jpg'},
      {'title': 'Animation', 'image': 'assets/inside_out.jpg'},
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
                                genreTitle: genre['title']!,
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
