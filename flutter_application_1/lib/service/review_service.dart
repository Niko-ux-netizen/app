
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:namer_app/model/Review.dart';
import 'Movie.dart';

class ReviewService {

  final String baseUrl = 'http://10.0.2.2:8080/api/review';

Future<void> addOrUpdateReview(Review review, String email, String title) async {
    final response = await http.post(
      Uri.parse('$baseUrl?email=$email&title=$title'),
      headers: {'Content-Type': 'application/json'},
      body: review.toJson(),
    );
  }
}