// browse_screen.dart
// This is the main Home screen of TownHappening.
// It shows a scrollable list of all local events with a category filter bar.
// Users can tap a heart to favorite an event or tap a card to see details.
// Name: Danielle Kemp


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/event.dart';
import '../models/event_data.dart';
import '../providers/favorites_provider.dart';
import '../widgets/event_card.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  // Tracks which category filter is selected
  String _selectedCategory = 'All';

  // Tracks what the user types in the search bar
  String _searchQuery = '';

  // Tracks the current location shown in the header
  String _location = 'Hobart, IN';

  // The text controller lets us read what's in the search box
  final TextEditingController _searchController = TextEditingController();

  // All category options
  final List<String> _categories = [
    'All',
    'Music',
    'Food',
    'Sports',
    'Arts',
    'Community',
    'Family',
  ];

  // Opens a dialog so the user can change their location
  void _showLocationDialog() {
    final TextEditingController locationController =
    TextEditingController(text: _location);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Location'),
        content: TextField(
          controller: locationController,
          decoration: const InputDecoration(
            labelText: 'City, State',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _location = locationController.text;
              });
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3D6B4F),
              foregroundColor: Colors.white,
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Always dispose controllers when the widget is removed
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Filter events by category AND search query
    final filteredEvents = events.where((event) {
      final matchesCategory =
          _selectedCategory == 'All' || event.category == _selectedCategory;
      final matchesSearch =
          event.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              event.location.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      body: Column(
        children: [
          // Green Header
          Container(
            color: const Color(0xFF3D6B4F),
            // SafeArea pushes content below the status bar
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Location row, tap to change location
                    GestureDetector(
                      onTap: _showLocationDialog,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.my_location,
                            color: Colors.white70,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _location,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),

                    // App title
                    const Text(
                      'TownHappening',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Search bar
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          // Update search query as user types
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search events, venues...',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // category Filter Chips (below the green header)
          Container(
            color: Colors.white,
            height: 52,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = category == _selectedCategory;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 4),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF3D6B4F)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF3D6B4F)
                            : Colors.grey.shade300,
                      ),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : Colors.grey.shade600,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // ── Event List ──
          Expanded(
            child: filteredEvents.isEmpty
                ? const Center(
              child: Text(
                'No events found.',
                style: TextStyle(color: Colors.grey),
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredEvents.length,
              itemBuilder: (context, index) {
                final event = filteredEvents[index];
                return EventCard(event: event);
              },
            ),
          ),
        ],
      ),
    );
  }
}