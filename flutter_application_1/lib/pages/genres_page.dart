import 'package:flutter/material.dart';
class GenresPage extends StatelessWidget {
  const GenresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Genres'),
      ),
      body: const Center(
        child: Text(
          'Genres',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFDAAB2D)),
        ),
      ),
    );
  }
}
