// event_card.dart
// This is the reusable event card widget used on both the Browse
// and Favorites screens. It shows the event title, category badge,
// date, time, location, attendees, and a heart button.
// We made this a separate widget so we don't have to write it twice
// Name: Danielle Kemp

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/event.dart';
import '../providers/favorites_provider.dart';
import '../screens/event_detail_screen.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final isFavorited = favoritesProvider.isFavorite(event.id);
    final categoryColor = _getCategoryColor(event.category);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailScreen(event: event),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Event Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Image.asset(
                event.imageAsset,
                width: 100,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),

            // Event Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category Badge + Favorite Icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: categoryColor['bg'],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            event.category,
                            style: TextStyle(
                              color: categoryColor['text'],
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            favoritesProvider.toggleFavorite(event.id);
                          },
                          child: Icon(
                            isFavorited
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorited
                                ? const Color(0xFFD85A30)
                                : Colors.grey.shade400,
                            size: 22,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    // Title
                    Text(
                      event.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E2820),
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Date
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 12,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${event.date} · ${event.time}',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 3),

                    // Location
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 12,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          event.location,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 3),

                    // Attendees
                    Row(
                      children: [
                        const Icon(
                          Icons.people_outline,
                          size: 12,
                          color: Color(0xFF3D6B4F),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${event.attendees} going',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF3D6B4F),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, Color> _getCategoryColor(String category) {
    switch (category) {
      case 'Music':
        return {
          'bg': const Color(0xFFEAF2EC),
          'text': const Color(0xFF2D5A40),
        };

      case 'Food':
        return {
          'bg': const Color(0xFFFEF3E8),
          'text': const Color(0xFFA0520F),
        };

      case 'Sports':
        return {
          'bg': const Color(0xFFE8F0FE),
          'text': const Color(0xFF2650A8),
        };

      case 'Arts':
        return {
          'bg': const Color(0xFFFBE9F5),
          'text': const Color(0xFF8B2F78),
        };

      case 'Community':
        return {
          'bg': const Color(0xFFFFF0E0),
          'text': const Color(0xFFA0520F),
        };

      case 'Family':
        return {
          'bg': const Color(0xFFE6F1FB),
          'text': const Color(0xFF185FA5),
        };

      default:
        return {
          'bg': const Color(0xFFEAF2EC),
          'text': const Color(0xFF2D5A40),
        };
    }
  }
}