import 'package:flutter/material.dart';
import 'package:namer_app/pages/history_page.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  int? selectedMovieIndex; // Track the selected movie index
  final List<Map<String, String>> movies = [
      {'title': 'Top Gun: Maverick', 'image': 'assets/top_gun.jpg'},
      {'title': 'Oppenheimer', 'image': 'assets/oppenheimer.jpg'},
      {'title': 'Inside Out', 'image': 'assets/inside_out.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Watchlist"),
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
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  final isSelected = selectedMovieIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMovieIndex = isSelected ? null : index;
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
                                  child: Image.asset(
                                    movie['image']!,
                                    fit: BoxFit.cover,
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
                            child: Container(
                              color: Colors.black.withOpacity(0.7),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          // Show SnackBar and navigate to HistoryPage
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                "Nice that you watched ${movie['title']}! You should review it.",
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
                                        },
                                        icon: const Icon(Icons.check, color: Colors.green),
                                        iconSize: 32, // Adjust icon size
                                        tooltip: 'Mark as watched',
                                      ),
                                      const SizedBox(width: 16),
                                      IconButton(
                                        onPressed: () {
                                          // Show SnackBar for delete
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                "${movie['title']} removed from watchlist",
                                              ),
                                            ),
                                          );
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
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}