class Movie {
  final String id;
  final String title;
  final Set<String> genres;
  final String? image; // Make image nullable

  Movie({
    required this.id,
    required this.title,
    required this.genres,
    this.image, // Nullable field
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'].toString(), // Convert id to String
      title: json['title'] as String,
      genres: Set<String>.from(json['genres'] ?? []),
      image: json['image'], // Handle nullable image
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'genres': genres.toList(),
      'image': image, // Nullable field
    };
  }
}
