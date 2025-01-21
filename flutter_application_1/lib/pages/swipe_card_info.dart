import 'package:flutter/material.dart';
import 'package:namer_app/model/genre.dart';
import 'package:namer_app/model/movie.dart';

class GenreInfo extends StatelessWidget {
  final Movie movie;

  const GenreInfo({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.93),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            ...movie.genres.map(
              (genre) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: genre.color,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                      offset: Offset(4.0, 4.0),
                    ),
                  ],
                ),
                child: Text(
                  genre.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 187, 207, 1),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6.0,
                    spreadRadius: 2.0,
                    offset: Offset(4.0, 4.0),
                  ),
                ],
              ),
              child: Text(
                movie.producer,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              movie.title.toUpperCase(),
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.description,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 24.0),
                  Icon(Icons.star, color: Colors.amber, size: 24.0),
                  Icon(Icons.star, color: Colors.amber, size: 24.0),
                  Icon(Icons.star, color: Colors.amber, size: 24.0),
                  Icon(Icons.star_half, color: Colors.amber, size: 24.0),
                  SizedBox(width: 8.0),
                  Text(
                    "4.5/5.0",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
