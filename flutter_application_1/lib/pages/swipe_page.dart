import 'package:flutter/material.dart';
import 'package:namer_app/pages/swipe_card.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({super.key});

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  final List<String> genres = [
    'Science Fiction',
    'Space',
    'Spectacular',
    'Christopher Nolan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SwipeCard(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.93),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: genres
                  .map(
                    (genre) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 147, 212, 144),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        genre,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                "Interstellar",
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hallo Anthonny en Nikolai, alles goed met jullie? Ik heb mijn best gedaan op deze pagina en chatGPT heeft mij goed kunne helpen, danku!",
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
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}
