import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../model/review.dart';



class ReviewService {

  final String baseUrl = 'http://10.0.2.2:8080/api/review';

  Future<void> addOrUpdateReview(Review review, String email, String title) async {
    print(review.toJson());
    print(email);
    print(title);

    final response = await http.post(
      Uri.parse('$baseUrl?email=$email&title=$title'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(review.toJson()),
    );

    if (response.statusCode == 200) {
      print('Review submitted successfully');
    } else {
      print('Failed to submit review: ${response.statusCode}');
    }
  }
}