// favorites_provider.dart
// This file manages which events the user has favorited.
// We use ChangeNotifier so that when favorites change, the UI
// automatically updates. We also use SharedPreferences so favorites
// are saved even when the app is closed and reopened
// Name: Danielle Kemp

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/event.dart';

class FavoritesProvider extends ChangeNotifier {
  // holds the IDs of favorited events.
  List<int> _favoriteIds = [];

  // lets other files READ the favorites list but not change it directly
  List<int> get favoriteIds => _favoriteIds;

  // loads any saved favorites from the device
  FavoritesProvider() {
    _loadFavorites();
  }

  // Checks if a specific event is favorited
  bool isFavorite(int eventId) {
    return _favoriteIds.contains(eventId);
  }

  // Adds or removes a favorite depending on if it's already saved
  void toggleFavorite(int eventId) {
    if (_favoriteIds.contains(eventId)) {
      _favoriteIds.remove(eventId);
    } else {
      _favoriteIds.add(eventId);
    }

    // Tell Flutter to rebuild any widgets that are listening
    notifyListeners();

    // Save the updated list to the device
    _saveFavorites();
  }

  // Gets the full list of favorited Event objects (not just IDs)
  List<Event> getFavoriteEvents(List<Event> allEvents) {
    return allEvents
        .where((event) => _favoriteIds.contains(event.id))
        .toList();
  }

  // Saves the favorites list to the device using SharedPreferences
  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    // We convert our list of ints to a list of strings because

    prefs.setStringList(
      'favorites',
      _favoriteIds.map((id) => id.toString()).toList(),
    );
  }

  // Loads the favorites list from the device when the app opens
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('favorites');
    if (saved != null) {

      _favoriteIds = saved.map((id) => int.parse(id)).toList();

      notifyListeners();
    }
  }
}