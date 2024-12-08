import 'package:flutter/material.dart';
import 'package:namer_app/pages/rate_page.dart';
import 'pages/watchlist_page.dart';
import 'pages/history_page.dart';
import 'pages/genres_page.dart';
import 'pages/party_page.dart';
import 'pages/login_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Form App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFDAAB2D),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF262626),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF400128),
          foregroundColor: Color(0xFFDAAB2D),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bingee'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF262626),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF400128),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Color(0xFFDAAB2D),
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.list, color: Color(0xFFDAAB2D)),
              title: const Text('Watchlist', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WatchlistPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Color(0xFFDAAB2D)),
              title: const Text('History', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoryPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.category, color: Color(0xFFDAAB2D)),
              title: const Text('Genres', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GenresPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.group, color: Color(0xFFDAAB2D)),
              title: const Text('Party', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PartyPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.login, color: Color(0xFFDAAB2D)),
              title: const Text('Login', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),

          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        color: const Color(0xFF262626), // Use "color" to set the background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Add an icon or logo above the text (optional)
            Icon(
              Icons.movie_creation_outlined,
              size: 100,
              color: Color(0xFFDAAB2D),
            ),
            const SizedBox(height: 20), // Space between the icon and text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Welcome to Bingee, the #1 personal movie app in the world!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFDAAB2D),
                ),
              ),
            ),
            const SizedBox(height: 20), // Space below the text
            // Add a button for a potential action
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GenresPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFDAAB2D),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


