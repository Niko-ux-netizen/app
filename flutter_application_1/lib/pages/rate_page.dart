import 'package:flutter/material.dart';

import '../model/review.dart';
import '../service/review_fetcher.dart';

class RatePage extends StatefulWidget {
  final String title;
  final String image;

  const RatePage({super.key, required this.title, required this.image});

  @override
  State<RatePage> createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {
  int selectedStars = 0;
  final TextEditingController reviewController = TextEditingController();
  final ReviewService reviewService = ReviewService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rate this movie"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      selectedStars = index + 1;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    color: index < selectedStars ? Colors.yellow : Colors.white,
                    size: 32,
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            Expanded(
              flex: 1,
              child: TextField(
                controller: reviewController,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Write here your review",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Review review = Review(
                      rating: selectedStars,
                      comment: reviewController.text,
                    );

                    await reviewService.addOrUpdateReview(review, 'Caann@mail.com', widget.title);

                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pop(context);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text("Post"),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
