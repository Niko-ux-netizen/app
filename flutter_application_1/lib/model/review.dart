class Review {
  final int rating;
  final String comment;

  Review({
    required this.rating,
    required this.comment
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'],
      comment: json['comment'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'comment': comment
    };
  }
}