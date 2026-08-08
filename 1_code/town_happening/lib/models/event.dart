// event.dart
// This file defines the Event data model for TownHappening.
// Each event object holds all the info we need to display on the app.
// Name: Danielle Kemp

class Event {
  final int id;
  final String title;
  final String category;
  final String date;
  final String time;
  final String location;
  final String description;
  final int attendees;
  final String imageAsset;

  // Constructor
  const Event({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.time,
    required this.location,
    required this.description,
    required this.attendees,
    required this.imageAsset,
  });
}