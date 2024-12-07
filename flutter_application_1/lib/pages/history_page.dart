import 'package:flutter/material.dart';

import 'rate_page.dart'; // Import the RatePage

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int? selectedMovieIndex; // Track which movie is selected

  @override
  Widget build(BuildContext context) {
    final movies = [
      {'title': 'Interstellar', 'image': 'assets/interstellar.jpg'},
      {'title': 'Everything Everywhere All At Once', 'image': 'assets/everything_everywhere.jpg'},
      {'title': 'Avatar: The Way of Water', 'image': 'assets/avatar.jpeg'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        onTap: () {
          // Deselect if you tap outside
          setState(() {
            selectedMovieIndex = null;
          });
        },
        child: Padding(
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
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    final isSelected = selectedMovieIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedMovieIndex = isSelected ? null : index; // Toggle selection
                        });
                      },
                      child: Stack(
                        children: [
                          Card(
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
                                    child: ColorFiltered(
                                      colorFilter: isSelected
                                          ? ColorFilter.mode(
                                              Colors.black.withOpacity(0.6),
                                              BlendMode.srcATop,
                                            )
                                          : const ColorFilter.mode(
                                              Colors.transparent,
                                              BlendMode.multiply,
                                            ),
                                      child: Image.asset(
                                        movie['image']!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    movie['title']!,
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
                          if (isSelected)
                            Positioned.fill(
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Navigate to RatePage when the button is clicked
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
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                  ),
                                  child: const Text('Rate'),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
