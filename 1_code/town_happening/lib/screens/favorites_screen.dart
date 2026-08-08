// favorites_screen.dart
// This screen shows all the events the user has favorited.
// If no events are favorited yet, it shows a friendly empty state message.
// Favorites are loaded from SharedPreferences so they persist between sessions
// Name: Danielle Kemp

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/event_data.dart';
import '../providers/favorites_provider.dart';
import '../widgets/event_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // listen to the favorites provider so the list updates automatically
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    // Get only the events that the user has favorited
    final favoriteEvents = favoritesProvider.getFavoriteEvents(events);

    return Scaffold(
      // Green Header
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D6B4F),
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Favorites',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              // Shows how many events are favorited
              '${favoriteEvents.length} event${favoriteEvents.length != 1 ? 's' : ''} favorited',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),

      body: favoriteEvents.isEmpty
      // Empty State (no favorites yet)
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // heart icon
            Icon(
              Icons.favorite_border,
              size: 72,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 16),
            const Text(
              'No favorites yet!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tap the heart on any event\nto save it here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      )
      // Favorites List
          : ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: favoriteEvents.length,
        itemBuilder: (context, index) {
          final event = favoriteEvents[index];
          // We reuse the same EventCard widget from the browse screen
          return EventCard(event: event);
        },
      ),
    );
  }
}