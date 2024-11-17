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

### 1. Clone the Repository
```bash
git clone https://github.com/your-repo/currency_converter_app.git
```

### 2. Install Dependencies
```dart
flutter pub get
```

### 3. Set Up API Key
- Register on the public API platform 👉 [ExchangeRatesAPI](https://exchangeratesapi.io/)
- Note the free-tier limitations and available endpoints.
- Add your API key in the following file:
```dart
// File: lib/utils/api_endpoints.dart
static const apiKEY = 'your_api_key_here';
```

### 4. Firebase Configuration:
- Create a Firebase project in your account.
- Add both Android and iOS apps to the Firebase project.
- Download the google-services.json file for Android and GoogleService-Info.plist for iOS.
- Place these files in the appropriate directories as per Firebase setup instructions.

### 5. Testing API Endpoints:
- Use Postman to check and validate endpoints, parameters, and responses before integrating them into the app.

### 6. Run the App
```dart
flutter run
```

## Architecture
- The app is built using Clean Architecture with a focus on scalability and separation of concerns.
- State Management: Used the <a href="https://bloclibrary.dev/#/"><img src="https://tinyurl.com/bloc-library" alt="Bloc Library"></a> library to manage state effectively and ensure a reactive UI.
- Folder Structure:
```bash
  root/
  ├── android/
  └── assets/
      ├── fonts/
      ├── images/
      ├── svg/
      └── translations/
  ├── ios/
  └── lib/
      ├── core/
      └── features/
          └── advance_exchange/
              └── data/
                  ├── datasources/
                  ├── model/
                  └── repositories/
              └── domain/
                  ├── entities/
                  ├── repositories/
                  └── usecases/
              └── presentation/
                  ├── blocs/
                  ├── widgets/
                  └── advance_exchange_screen.dart
      └── utils/
          ├── api_endpoints.dart
          ├── colors.dart
          ├── font.dart
          └── globals.dart
      ├── currency_labs_app.dart
      ├── firebase_options.dart
      ├── injector.dart
      └── main.dart
  └── packages/
      └── currency_picker/  
  ├── test/
  ├── .gitignore
  ├── best_coding_practices.md
  ├── firebase.json
  ├── pubspec.yaml
  └── README.md
```

## Best Coding Practices
- Directories and files should be named in `snake_case`.
```
dir_one
└── my_folder
    ├── example.dart
    └── custom_class.dart
```

- All private variables and private methods should not start with underscores
```dart
// Do
bool isLoading = true;
void myFunction() {}

// Do not
bool _isLoading = true;
void _myFunction() {}
```

- Constants, variables, parameters, and named parameters should be named in `lowerCamelCase`
- Classes, types, extension names, and enums should be typed in `UpperCamelCase`
- Proper and **meaningful** naming practices should be followed

👉 Please read [best_coding_practices.md](https://github.com/MalinthaSamarasinghe/currency_labs/blob/master/best_coding_practices.md) file for more information

# Implementation Details

## Covered Aspects
- All requirements in the assignment document have been fully implemented.

## Uncovered Aspects
- None.

# Challenges & Solutions

## Challenges
- Restricting Base Currency: Implementing a restriction to allow only EUR as the base currency while keeping the architecture flexible for future updates.
- API Constraints: Managing API rate limits and handling potential issues like slow connectivity or failed requests efficiently.
- Tight Deadline: Completing the project within a short 24-hour time frame required balancing feature completeness and code quality.

## Solutions
- Scalable Design: Designed the app with Clean Architecture and BLoC for modularity, making it easier to adapt to future requirements.
- Error Handling: Implemented detailed error messages and fallback mechanisms to provide users with a seamless experience even during API failures or connectivity issues.
- Time Management: Leveraged prior experience to prioritize critical functionalities, ensuring all requirements were met within the limited timeframe.

# Future Improvements
- Complete App Deployment: Fully implement the app to meet publishing standards for app stores.
- User Authentication: Integrate Firebase authentication for user sign-in and security (ongoing development).
- In-App Purchases: Add premium features for paid users through in-app purchases.
- Advertisements: Integrate ads for free-tier users to generate revenue.
- Push Notifications: Enable notifications for active users to stay updated with rate changes.
- Expanded Base Currency Options: Add support for all base currencies to cater to a wider audience.
- Historical Rate Data: Implement features for users to view exchange rates for specific dates or date ranges.
- Data Visualization: Include charts and graphs to visually represent exchange rate trends and analytics.
- Quick Converter: Add a simple converter with a swap function for two selected currencies.
- Dark Mode: Finalize and implement dark mode (ongoing development).
- Localization: Add support for multiple languages to cater to a global audience (ongoing development).
- Tablet Optimization: Adapt the app interface for tablet devices, ensuring a responsive and user-friendly experience.
- Enhanced UI/UX: Introduce animations, transitions, and additional themes to improve the app's overall aesthetics.
- Testing: Implement comprehensive unit and integration tests to ensure the app's reliability and maintainability.

# Features in Action
| Mobile View                                                                                                           | Completed  |
|-----------------------------------------------------------------------------------------------------------------------| - |
| <img width="200" src="https://github.com/MalinthaSamarasinghe/parallax_ship_track/blob/master/screenshots/ss_1.png"/> | ✅ |
| <img width="200" src="https://github.com/MalinthaSamarasinghe/parallax_ship_track/blob/master/screenshots/ss_2.png"/> | ✅ |
| <img width="200" src="https://github.com/MalinthaSamarasinghe/parallax_ship_track/blob/master/screenshots/ss_3.png"/> | ✅ |
| <img width="200" src="https://github.com/MalinthaSamarasinghe/parallax_ship_track/blob/master/screenshots/ss_4.png"/> | ✅ |
| <img width="200" src="https://github.com/MalinthaSamarasinghe/parallax_ship_track/blob/master/screenshots/ss_5.png"/> | ✅ |
| <img width="200" src="https://github.com/MalinthaSamarasinghe/parallax_ship_track/blob/master/screenshots/ss_6.png"/> | ✅ |
