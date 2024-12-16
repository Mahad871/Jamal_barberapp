# Jamal Barber App

A Flutter-based mobile application that connects users with barbers, allowing them to find and book appointments with nearby barbers.

## Features

- User authentication (Sign up/Login) for both customers and barbers
- Barber profile listings with ratings and reviews
- Location-based barber search (find barbers within 800m)
- Appointment booking system
- Real-time barber availability status
- Multilingual support (English and Arabic)
- Rating system for barber services

## System Requirements

- Dart SDK Version 2.18.0 or greater
- Flutter SDK Version 3.3.0 or greater

## Tech Stack

- Frontend: Flutter/Dart
- Backend: Firebase
- Authentication: Firebase Auth
- Database: Cloud Firestore
- State Management: Provider

## Project Structure

```plaintext
.
├── android/                # Android platform specific files
├── assets/                # Images and fonts
├── ios/                   # iOS platform specific files
└── lib/                   # Core application code
    ├── controllers/      # Business logic
    ├── core/            # Constants and utilities
    ├── models/          # Data models
    ├── presentation/    # UI screens and widgets
    ├── routes/          # Navigation routes
    ├── theme/           # App theming
    └── widgets/         # Reusable widgets
```

## Key Libraries

- Provider - State management
- cached_network_image - Image caching
- cloud_firestore - Firebase database integration
- fluttertoast - Toast notifications
- intl - Internationalization

## Setup and Installation

1. Clone the repository
2. Ensure Flutter and Dart are installed on your system
3. Run `flutter pub get` to install dependencies
4. Configure Firebase project and add configuration files
5. Run `flutter run` to start the application

## Language Support

- English
- Arabic

## Contributing

Feel free to open issues and pull requests for any improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

[@Mahad871](https://github.com/Mahad871)

---
Last Updated: 2024-12-16
