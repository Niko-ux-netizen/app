import 'package:flutter/material.dart';

class Genre {
  final String name;
  final Color color;

  Genre({required this.name}) : color = _getColorForGenre(name);

  static Color _getColorForGenre(String name) {
    switch (name.toLowerCase()) {
      case 'horror':
        return Colors.red;
      case 'science fiction':
        return Colors.purple;
      case 'space':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
