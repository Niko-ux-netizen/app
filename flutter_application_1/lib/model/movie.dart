import 'dart:convert';

class Movie {
  final String id; // Keeping id as String for consistency
  final String title;
  final Set<String> genres; // Set of strings for genres
  final String? image; // Optional image
  final String producer;
  final String description;

  Movie({
    required this.id,
    required this.title,
    required this.genres,
    this.image,
    required this.producer,
    required this.description,
  });

  // Factory constructor for creating a Movie from a JSON object
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'].toString(), // Convert id to String for consistency
      title: json['title'] as String,
      genres: (json['genres'] as List<dynamic>)
          .map((genre) => genre.toString())
          .toSet(),
      image: json['image'] as String?, // Optional field
      producer: json['producer'] as String? ?? 'Unknown Producer', // Default value if missing
      description: json['description'] as String? ?? 'No description available', // Default value if missing
    );
  }

  // Method to convert a Movie object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'genres': genres.toList(), // Convert Set<String> to List<String>
      'image': image,
      'producer': producer,
      'description': description,
    };
  }
}
