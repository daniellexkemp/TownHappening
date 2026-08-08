// event_detail_screen.dart
// This screen shows the full details of a single event.
// It is opened when the user taps on an event card.
// It shows the title, date, time, location, description,
// a heart button to favorite, and a share button!
// Name: Danielle Kemp


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/event.dart';
import '../providers/favorites_provider.dart';

class EventDetailScreen extends StatelessWidget {
  // pass the event in when we navigate to this screen
  final Event event;

  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    // listen to the favorites provider so the heart updates live
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final isFavorited = favoritesProvider.isFavorite(event.id);

    // This is the color for the category badge
    final categoryColor = _getCategoryColor(event.category);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Green Header with Back Button
          SliverAppBar(
            backgroundColor: const Color(0xFF3D6B4F),
            expandedHeight: 120,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: categoryColor['bg'],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      event.category,
                      style: TextStyle(
                        color: categoryColor['text'],
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Event title
                  Text(
                    event.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Event Image
          SliverToBoxAdapter(
            child: Image.asset(
              event.imageAsset,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),

          // Event Details Body
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date and time row
                  _detailRow(
                    icon: Icons.calendar_today_outlined,
                    label: 'Date & time',
                    value: '${event.date} · ${event.time}',
                  ),
                  const SizedBox(height: 16),

                  // Location row
                  _detailRow(
                    icon: Icons.location_on_outlined,
                    label: 'Location',
                    value: event.location,
                  ),
                  const SizedBox(height: 16),

                  // Attendees row
                  _detailRow(
                    icon: Icons.people_outline,
                    label: 'Attending',
                    value: '${event.attendees} going',
                  ),
                  const SizedBox(height: 20),

                  // Divider line
                  const Divider(),
                  const SizedBox(height: 12),

                  // Description
                  Text(
                    event.description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Save and Share Buttons
                  Row(
                    children: [
                      // Save/Unsave button
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            favoritesProvider.toggleFavorite(event.id);
                          },
                          icon: Icon(
                            isFavorited
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorited
                                ? Colors.white
                                : const Color(0xFF3D6B4F),
                          ),
                          label: Text(
                            isFavorited ? 'Saved' : 'Save',
                            style: TextStyle(
                              color: isFavorited
                                  ? Colors.white
                                  : const Color(0xFF3D6B4F),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: isFavorited
                                ? const Color(0xFF3D6B4F)
                                : Colors.transparent,
                            side: const BorderSide(
                                color: Color(0xFF3D6B4F)),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Share button
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // This uses share_plus to share the event info
                            Share.share(
                              '📍 ${event.title}\n'
                                  '📅 ${event.date} at ${event.time}\n'
                                  '📌 ${event.location}\n\n'
                                  '${event.description}\n\n'
                                  'Shared via TownHappening!',
                            );
                          },
                          icon: const Icon(Icons.share, color: Colors.white),
                          label: const Text(
                            'Share',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3D6B4F),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
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
    );
  }

  // Helper widget for each detail row (icon, label, value)
  Widget _detailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF3D6B4F), size: 20),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Returns the background and text color for each category badge
  Map<String, Color> _getCategoryColor(String category) {
    switch (category) {
      case 'Music':
        return {'bg': const Color(0xFFEAF2EC), 'text': const Color(0xFF2D5A40)};
      case 'Food':
        return {'bg': const Color(0xFFFEF3E8), 'text': const Color(0xFFA0520F)};
      case 'Sports':
        return {'bg': const Color(0xFFE8F0FE), 'text': const Color(0xFF2650A8)};
      case 'Arts':
        return {'bg': const Color(0xFFFBE9F5), 'text': const Color(0xFF8B2F78)};
      case 'Community':
        return {'bg': const Color(0xFFFFF0E0), 'text': const Color(0xFFA0520F)};
      case 'Family':
        return {'bg': const Color(0xFFE6F1FB), 'text': const Color(0xFF185FA5)};
      default:
        return {'bg': const Color(0xFFEAF2EC), 'text': const Color(0xFF2D5A40)};
    }
  }
}