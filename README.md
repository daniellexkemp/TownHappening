# 📍 TownHappening: Mobile Event Discovery & UX Case Study
**Lead Developer & UX Researcher:** Danielle
**Version:** 1.0  
**Tech Stack:** Flutter, Dart, Android Studio, Provider, SharedPreferences

---

<p align="center">
  <img src="./4_screenshots/1_home_feed.png" width="220" alt="Home Feed">
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="./4_screenshots/4_event_screen.png" width="220" alt="Event Details">
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="./4_screenshots/3_favorites_screen.png" width="220" alt="Favorites Screen">
</p>

---

## 📖 Project Overview
**TownHappening** is a mobile application designed to solve information fragmentation in small communities. In many small towns, local event information is scattered across Facebook pages, Instagram posts, physical flyers, and town websites—causing residents to miss out or give up searching entirely. 

TownHappening bridges this gap by aggregating local event discovery into a single, intuitive mobile platform grounded in empirical UX research and implemented using Flutter.

### Key Features:
* **Centralized Discovery Feed:** Scrollable event cards featuring high-res imagery, venue details, dates/times, category badges, and active attendee counters.
* **Real-Time Search & Category Filtering:** Dynamic string matching combined with swipeable, color-coded category chips (*Music*, *Food*, *Sports*, *Arts*, *Community*, *Family*).
* **Interactive Location Switcher:** Custom dialog enabling users to seamlessly update active city/town views without leaving the feed.
* **Persistent Favorites System:** Save events locally using `shared_preferences` with custom data serialization (`List<int>` ↔ `List<String>`) and a live bottom navigation badge counter.
* **Native System Sharing:** Integrated `share_plus` plugin to invoke native Android share sheets pre-populated with formatted event details.

---

## 📁 Repository Structure
This repository is organized into five main modules. Please click into each folder to view its specific documentation and assets:

1. [**1_code**](./1_code/): Contains the Flutter application codebase (`lib/`), dependencies (`pubspec.yaml`), and Android/Gradle source files.
2. [**2_testing**](./2_testing/): Contains the Flutter widget test suite and logic validation files.
3. [**3_ux_research**](./3_ux_research/): Includes Hierarchical Task Analysis (HTA) diagrams, UML activity maps, low-fidelity Marvel prototypes, and usability testing scripts.
4. [**4_screenshots**](./4_screenshots/): High-resolution application UI screenshots captured across all major flows.
5. [**5_documentation**](./5_documentation/): Contains the Project Proposal, Checkpoint Report, and Final Project Report.

---

## 🔬 UX Research & Human-Centered Design Process (NEWM-N450)

### 1. User Research & Pain Point Discovery
* **Needfinding Interviews:** Conducted semi-structured interviews with small-town residents across varied demographics (ages 18–64, parents, remote workers, long-time locals, and newcomers).
* **Core Problem Identified:** High interaction cost ("digging" through social algorithms) and unreliable/outdated event listings lead users to give up or discover events after they occur.
* **Persona Development:** Created user personas (e.g., *Sara L., 38*) targeting parents and residents seeking upfront event details (date, time, cost, parking) with zero unsolicited spam.

### 2. Task Architecture & Prototyping
* **Hierarchical Task Analysis (HTA):** Mapped out user workflows and friction points for finding, verifying, and committing to local events.
* **UML Activity Mapping:** Modeled app navigation decisions, search/filter merges, and favoriting logic.
* **Low-Fidelity Wireframing:** Designed initial low-fi layouts in Marvel to establish screen hierarchy and interaction flows.

### 3. Usability Evaluation & Data-Driven Iterations
* **In-Person Usability Testing:** Tested the interactive prototype with representative users performing task scenarios (finding, filtering, saving, and location switching).
* **Quantitative Validation:**
  * **Overall Ease of Use:** `4.7 / 5`
  * **Navigation Confidence:** `5.0 / 5`
  * **Category Filter Utility:** `5.0 / 5`
  * **Regular Usage Likelihood:** `4.7 / 5`
* **Design Sprint Iterations (Low-Fi ➔ High-Fi):**
  * **Header Contrast & Hierarchy:** Improved font readability and header contrast following user feedback regarding top-left element visibility.
  * **Event Detail Context:** Expanded card layouts and detail views to ensure location maps and host descriptions are accessible in one tap.
  * **Scalable Search:** Integrated dynamic keyword search alongside swipeable, color-coded category chips to prevent classification fatigue as event volume grows.

---

## 📸 UI & App Flow

| Category Filter | Native Share Sheet | Location Switcher | Live Keyword Search |
| :---: | :---: | :---: | :---: |
| <img src="4_screenshots/2_category_screen.png" width="180" /> | <img src="4_screenshots/5_sharing_screen.png" width="180" /> | <img src="4_screenshots/6_change_location.png" width="180" /> | <img src="4_screenshots/8_event_search.png" width="180" /> |

---

## 🏗️ Technical Architecture & File Map

```text
📦 TOWNHAPPENING
┣ 📂 1_code
┃ ┣ 📂 assets
┃ ┃ ┗ 📂 images
┃ ┣ 📂 lib
┃ ┃ ┣ 📂 models
┃ ┃ ┃ ┣ 📄 event.dart
┃ ┃ ┃ ┗ 📄 event_data.dart
┃ ┃ ┣ 📂 providers
┃ ┃ ┃ ┗ 📄 favorites_provider.dart
┃ ┃ ┣ 📂 screens
┃ ┃ ┃ ┣ 📄 browse_screen.dart
┃ ┃ ┃ ┣ 📄 event_detail_screen.dart
┃ ┃ ┃ ┗ 📄 favorites_screen.dart
┃ ┃ ┣ 📂 widgets
┃ ┃ ┃ ┗ 📄 event_card.dart
┃ ┃ ┗ 📄 main.dart
┃ ┣ 📜 analysis_options.yaml
┃ ┗ 📜 pubspec.yaml
┣ 📂 2_testing
┃ ┗ 📄 widget_test.dart
┣ 📂 3_ux_research
┃ ┣ 📜 Analysis_Deliverable.pdf
┃ ┣ 📜 Design_and_Prototype.pdf
┃ ┣ 📜 Evaluation.pdf
┃ ┗ 📜 User_Research.pdf
┣ 📂 4_screenshots
┃ ┣ 🖼️ 1_home_feed.png
┃ ┣ 🖼️ 2_category_screen.png
┃ ┣ 🖼️ 3_favorites_screen.png
┃ ┣ 🖼️ 4_event_screen.png
┃ ┣ 🖼️ 5_sharing_screen.png
┃ ┣ 🖼️ 6_change_location.png
┃ ┣ 🖼️ 7_chip_selection.png
┃ ┗ 🖼️ 8_event_search.png
┣ 📂 5_documentation
┃ ┣ 📜 Project_Proposal.pdf
┃ ┣ 📜 Project_Checkpoint_Report.pdf
┃ ┗ 📜 Project_Final_Report.pdf
┣ 📜 LICENSE
┗ 📜 README.md
```
## 🛠️ Technology Stack
| Layer | Technology |
| :--- | :--- |
| **Framework** | [Flutter](https://flutter.dev/) 3.x (Dart SDK) |
| **IDE / Platform** | Android Studio, Gradle, Kotlin |
| **State Management** | `provider` (`ChangeNotifier`) |
| **Local Persistence** | `shared_preferences` |
| **Native Plugins** | `share_plus` |
| **UI Components** | `CustomScrollView`, `SliverAppBar`, `ClipRRect`, `ListView.builder` |

---

## 🚀 Quick Start
To get this project running on your local machine or emulator:

1. **Clone the Repo:**
   ```bash
   git clone [https://github.com/daniellexkemp/TownHappening.git](https://github.com/daniellexkemp/TownHappening.git)
   cd TownHappening/1_code
    ```
2. **Install Dependencies:**
   ```bash
   flutter pub get
    ```
3. **Run Application: Launch an Android Emulator or connected device and run:**
   ```bash
   flutter run
   ```

## 👤 Academic Context
* **Institution:** Indiana University Indianapolis — Luddy School of Informatics, Computing, and Engineering
* **INFO-C 342:** Mobile Application Development (Build & Development)
* **NEWM-N450:** Usability & Design / UX Research (User Research, Prototyping, & Testing)

---

## 🛡️ Privacy & Security
* No personal user data or credentials are required or tracked by this application.
* Saved event lists are stored purely locally on the client device using `shared_preferences`.   