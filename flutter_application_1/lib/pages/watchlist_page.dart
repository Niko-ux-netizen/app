import 'package:flutter/material.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: const Center(
        child: Text(
          'Watchlist',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFDAAB2D)),
        ),
      ),
    );
  }
}