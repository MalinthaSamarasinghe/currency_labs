# Overview of Assignment - Flutter Developer

## Objective
- Develop a Flutter-based currency converter app with the following core functionalities:
    - Real-time currency conversion using an API.
    - Support for multiple target currencies.
    - User-friendly interface following the provided design.
    - Local data persistence for user preferences.

## Time Frame
- 24 hours

## Requirements

### 1. API Integration
- Integrated with a currency converter API for fetching live exchange rates.

### 2. Architecture
- Followed Clean Architecture principles with BLoC (Business Logic Component) for state management, ensuring modularity and separation of concerns.

### 3. Input
- Provided a TextField for users to input the amount to convert.
- Allowed users to select the input currency from a list of available currencies.

### 4. Output
- Displayed converted amounts for selected target currencies.
- Supported multiple target currencies with an option to add new ones dynamically.

### 5. Persistence
- Stored user-selected target currencies locally.
- Retained user preferences even after restarting the app.

### 6. Delete Functionality
- Enabled users to delete specific target currencies from the list.

# Developer's Guide

## Prerequisites
- Android Studio or Visual Studio Code 👉 [Latest Android Studio](https://developer.android.com/studio) 👉 [Latest Visual Studio Code](https://code.visualstudio.com/download)
- Flutter SDK `3.24.3` 👉 [Download Flutter SDK](https://docs.flutter.dev/release/archive?tab=windows)
- Dart (Already included in Flutter SDK)
- Postman 👉 [Latest Postman](https://www.postman.com/downloads/)
- Firebase account (Create and configure a Firebase project for Android and iOS)
- Internet connection

## Clone the Repository
```
git clone https://github.com/your-repo/currency_converter_app.git
```

## Install Dependencies
```dart
flutter pub get
```

## Set Up API Key
- Register on the public API platform 👉 [ExchangeRatesAPI](https://exchangeratesapi.io/)
- Note the free-tier limitations and available endpoints.
- Add your API key in the following file:
```dart
// File: lib/utils/api_endpoints.dart
static const apiKEY = 'your_api_key_here';
```

## Firebase Configuration:

Create a Firebase project in your account.
- Add both Android and iOS apps to the Firebase project.
- Download the google-services.json file for Android and GoogleService-Info.plist for iOS.
- Place these files in the appropriate directories as per Firebase setup instructions.

## Testing API Endpoints:
- Use Postman to check and validate endpoints, parameters, and responses before integrating them into the app.

## Run the App
```dart
flutter run
```
