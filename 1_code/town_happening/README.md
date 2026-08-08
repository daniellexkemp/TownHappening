# 💻 1_code: Mobile Application Source Code

This directory contains the complete source code for the **TownHappening** mobile application, developed in **Flutter** (Dart) for Android and iOS.

---

## 🏗️ Folder Architecture

```text
1_code/
├── assets/
│   └── images/              # Local image assets for event listings
├── lib/
│   ├── models/
│   │   ├── event.dart       # Event data model
│   │   └── event_data.dart  # Structured mock dataset
│   ├── providers/
│   │   └── favorites_provider.dart # State management & local persistence
│   ├── screens/
│   │   ├── browse_screen.dart       # Main discovery feed, search, & location modal
│   │   ├── event_detail_screen.dart # Collapsing header detail screen
│   │   └── favorites_screen.dart    # Persistent saved events screen
│   ├── widgets/
│   │   └── event_card.dart  # Reusable card component
│   └── main.dart            # Main entry point, app routing, & global theme
├── android/                 # Native Android configuration
├── analysis_options.yaml    # Dart linter configuration
└── pubspec.yaml             # App dependencies & asset definitions
```


## 🛠️ Key Technical Implementations

* **Reactive State Management:** Uses `provider` (`ChangeNotifier`) to propagate favorite state changes across screens instantly.
* **Local Data Persistence:** Uses `shared_preferences` to serialize saved event IDs (`List<int>`) locally so favorites persist across app restarts.
* **Native System Integration:** Utilizes `share_plus` to invoke Android native share sheets pre-filled with formatted event data.
* **Dynamic Search & Filtering:** Case-insensitive string matching across event titles, venue locations, and swipeable category tags.



## 🚀 Running the Code

From this directory (`1_code/`), execute:

```bash
flutter pub get
flutter run