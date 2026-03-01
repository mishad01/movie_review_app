# Movie Review App 
<img width="749" height="538" alt="Screenshot 2026-03-01 at 3 46 16 PM" src="https://github.com/user-attachments/assets/7ab79ce3-0983-48f5-8adb-c07bd115d131" />


## Features
- View trending and popular movies on the Home Screen.
- Search for specific movies using the Search Screen.
- Explore detailed information about movies on the Details Screen.

## Architecture
This project follows **Clean Architecture** principles to separate concerns, improve maintainability, and ensure scalability. The application is divided into standard layers:
- **Presentation**: UI components (Widgets, Screens) and state management to handle user interactions.
- **Domain**: Business logic, including use cases and entities that are independent of any specific framework.
- **Data**: Data retrieval mechanisms, including repositories, models, and data sources (API services).
- **Core**: Shared utilities, constants, exceptions, and foundational elements used across the application.

## Tech Stack
- **Framework**: Flutter
- **Language**: Dart
- **State Management**: Provider
- **Networking**: `http`
- **Image Caching**: `cached_network_image`

## Getting Started

### Prerequisites
- Flutter SDK `^3.10.8` or higher
- Dart SDK
- Android Studio, Xcode, or compatible IDE

### Installation
1. Clone the repository:
   ```bash
   git clone <repository_url>
   ```
2. Navigate to the project directory:
   ```bash
   cd moview_review_app_test
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```

### Run Commands
Run the application on an attached device or emulator:
```bash
flutter run
```
To run on specific platforms:
```bash
flutter run -d ios
flutter run -d android
flutter run -d chrome
```

## Project Structure
```text
lib/
├── core/            # Core utilities, extensions, and constants
├── data/            # Data layer (API integration, models, repositories)
├── domain/          # Domain layer (business logic, entities, use cases)
├── presentation/    # Presentation layer (UI, screens, widgets, state management)
└── main.dart        # Application entry point
```

## Usage / How It Works
1. **Launch**: Open the app to view the Home Screen, which automatically loads and displays trending and popular movies.
2. **Search**: Navigate to the Search Screen and enter a query to find specific movies from the data source.
3. **Details**: Tap on any movie card or list item to open the Details Screen and view complete movie information.

## Contributing
This is an educational project. Feel free to fork and experiment!

## License
This project is created for educational purposes as part of Ostad Batch 11.
