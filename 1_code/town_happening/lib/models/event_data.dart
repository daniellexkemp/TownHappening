// event_data.dart
// This file contains all of our hardcoded event data for TownHappening.
// Since we are not using a real database or API, we just store our
// events here as a simple list. "fake database"
// Name: Danielle Kemp

import 'event.dart';

// List of events
const List<Event> events = [
  Event(
    id: 1,
    title: 'Hobart Farmers Market',
    category: 'Food',
    date: 'Sat, Jun 14',
    time: '8:00 AM',
    location: 'Festival Park',
    description: 'Fresh produce, baked goods, and local crafts every Saturday morning. Come support your local vendors!',
    attendees: 142,
    imageAsset: 'assets/images/farmersmarket.png'
  ),
  Event(
    id: 2,
    title: 'Summer Concert in the Park',
    category: 'Music',
    date: 'Fri, Jun 20',
    time: '6:30 PM',
    location: 'Festival Park',
    description: 'Live bluegrass music under the stars. Bring a blanket and lawn chairs for a fun night out!',
    attendees: 320,
    imageAsset: 'assets/images/summerconcert.png'
  ),
  Event(
    id: 3,
    title: '4th of July Parade',
    category: 'Community',
    date: 'Fri, Jul 4',
    time: '10:00 AM',
    location: 'Main Street',
    description: 'Annual parade with floats, marching bands, and community celebration. A Hobart tradition!',
    attendees: 890,
    imageAsset: 'assets/images/fourthofjuly.png',
  ),
  Event(
    id: 4,
    title: 'Community 5K Fun Run',
    category: 'Sports',
    date: 'Sun, Jun 22',
    time: '7:00 AM',
    location: 'Cedar Trail',
    description: 'All skill levels welcome! Registration includes a t-shirt and post-race breakfast.',
    attendees: 65,
    imageAsset: 'assets/images/marathon.png',
  ),
  Event(
    id: 5,
    title: 'Art in the Alley',
    category: 'Arts',
    date: 'Sat, Jun 28',
    time: '11:00 AM',
    location: 'Elm Alley',
    description: 'Local artists display and sell original work in our charming downtown alley. Free to browse!',
    attendees: 78,
    imageAsset: 'assets/images/artalley.png',
  ),
  Event(
    id: 6,
    title: 'Autumn Harvest Festival',
    category: 'Food',
    date: 'Sat, Sep 27',
    time: '10:00 AM',
    location: 'Town Square',
    description: 'Celebrate the harvest with apple cider, pumpkins, hayrides, and live folk music. Family friendly!',
    attendees: 410,
    imageAsset: 'assets/images/harvestfestival.png',
  ),
  Event(
    id: 7,
    title: 'Lions Club Pancake Breakfast',
    category: 'Community',
    date: 'Sun, Jul 13',
    time: '9:00 AM',
    location: 'VFW Hall',
    description: 'All you can eat pancakes supporting the local Lions Club. A beloved community tradition since 1975!',
    attendees: 200,
    imageAsset: 'assets/images/pancake.png',
  ),
  Event(
    id: 8,
    title: 'Lakefront Fireworks Show',
    category: 'Family',
    date: 'Fri, Jul 4',
    time: '9:00 PM',
    location: 'Lake George Lakefront',
    description: 'Watch a spectacular fireworks display over Lake George. Bring your family and grab a great spot early!',
    attendees: 1200,
    imageAsset: 'assets/images/fireworks.png',
  ),
];