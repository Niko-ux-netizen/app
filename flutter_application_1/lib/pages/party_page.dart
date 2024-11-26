import 'package:flutter/material.dart';

class PartyPage extends StatelessWidget {
  const PartyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Party'),
      ),
      body: const Center(
        child: Text(
          'Party',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFDAAB2D)),
        ),
      ),
    );
  }
}