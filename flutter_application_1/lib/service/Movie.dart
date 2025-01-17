class Movie {
  final String id;
  final String title;
  final Set<String> genres;
  final String image;
  Movie({required this.id, required this.title, required this.genres, required this.image});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      genres: Set<String>.from(json['genres'] ?? []),
      image: json['image']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'genres': genres.toList(),
      'image' : image
    };
  }
}

