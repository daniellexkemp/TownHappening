// main.dart
// This is the starting point of TownHappening
// It sets up the app theme, the favorites provider, and the
// bottom navigation bar that switches between Browse and Favorites.
// Name: Danielle Kemp

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/favorites_provider.dart';
import 'screens/browse_screen.dart';
import 'screens/favorites_screen.dart';

void main() {
  runApp(
    // ChangeNotifierProvider makes our FavoritesProvider available to every screen in the app
    ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: const TownHappeningApp(),
    ),
  );
}

class TownHappeningApp extends StatelessWidget {
  const TownHappeningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TownHappening',
      // Hide the debug banner in the top right corner
      debugShowCheckedModeBanner: false,
      // This sets the overall color theme of the app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3D6B4F),
        ),
        useMaterial3: true,
        fontFamily: 'sans-serif',
        scaffoldBackgroundColor: const Color(0xFFF7F5F0),
      ),
      home: const MainNavigation(),
    );
  }
}

// navigation bar
// switches between the Browse and Favorites screens
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  // Keeps track of which tab is currently selected
  // 0 = Browse, 1 = Favorites
  int _currentIndex = 0;

  // The two screens we switch between
  final List<Widget> _screens = [
    const BrowseScreen(),
    const FavoritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Wshow the favorites count badge on the heart icon
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favCount = favoritesProvider.favoriteIds.length;

    return Scaffold(
      // Shows the currently selected screen
      body: _screens[_currentIndex],

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF3D6B4F),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: (index) {
          // When a tab is tapped, switch to that screen
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          // Browse tab
          const BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Browse',
          ),
          // Favorites tab with a badge showing the count
          BottomNavigationBarItem(
            icon: Badge(
              label: Text('$favCount'),
              isLabelVisible: favCount > 0,
              child: const Icon(Icons.favorite_border),
            ),
            activeIcon: Badge(
              label: Text('$favCount'),
              isLabelVisible: favCount > 0,
              child: const Icon(
                Icons.favorite,
                color: Color(0xFF3D6B4F),
              ),
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}