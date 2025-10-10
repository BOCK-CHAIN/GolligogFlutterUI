
# Golligog Flutter UI (iOS)

A modern, privacy-focused search engine application built with Flutter, featuring user authentication and a clean, intuitive interface inspired by popular search engines. This guide focuses on running and building the app for **iOS**.

## Features

- **User Authentication**: Secure login and signup functionality with persistent sessions
- **Privacy-Focused Search**: Powered by SearXNG, a metasearch engine that aggregates results from multiple search engines
- **Search History**: Track and manage your search queries
- **User Profiles**: Personalized user experience with profile management
- **Responsive Design**: Clean, modern UI that works across different screen sizes
- **Local Backend Integration**: Connects to local backend services for authentication and additional features


## Prerequisites (iOS)

Before running or building the iOS app, ensure you have the following:

- **macOS** with latest updates
- **Xcode** (latest version, with Command Line Tools)
- **Flutter SDK** (version 3.9.0 or higher)
- **CocoaPods** (install via `sudo gem install cocoapods`)
- **Dart SDK** (included with Flutter)
- **Backend Server**: Running on `http://localhost:5000` (handles authentication and user data)
- **SearXNG Instance**: Running on `http://localhost:8080` (provides search functionality)


## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/BOCK-CHAIN/GolligogFlutterUI.git
   cd GolligogFlutterUI
   ```

2. **Install Flutter dependencies**:
   ```bash
   flutter pub get
   ```

3. **Install CocoaPods dependencies** (from the `ios` directory):
   ```bash
   cd ios
   pod install
   cd ..
   ```

4. **Set up your development environment**:
   - Ensure Flutter is properly configured: `flutter doctor`
   - Open the project in Xcode for iOS-specific settings if needed


## Running the iOS App

### Prerequisites Setup

Before running the Flutter app, you need to start the required backend services:

1. **Start your backend server** on `localhost:5000`
2. **Start SearXNG** on `localhost:8080`

### Run the App on iOS Simulator or Device

1. **Connect an iOS device or start a simulator**:
   ```bash
   open -a Simulator # (or use Xcode to launch a simulator)
   flutter devices
   ```

2. **Run the application**:
   ```bash
   flutter run
   ```

   Or run in release mode:
   ```bash
   flutter run --release
   ```

## Building an iOS Release (IPA) File

To create a release build (IPA) for iOS:

1. **Ensure all dependencies are installed**:
   ```bash
   flutter pub get
   cd ios
   pod install
   cd ..
   ```

2. **Build the iOS app for release**:
   ```bash
   flutter build ios --release
   ```

   This will generate an Xcode project in the `ios/` directory and build the app for release.

3. **Archive and export IPA using Xcode**:
   - Open the project in Xcode: `open ios/Runner.xcworkspace`
   - Select your target device (Generic iOS Device or a real device)
   - Go to **Product > Archive**
   - After archiving, use the Xcode Organizer to export the `.ipa` file for App Store or Ad Hoc distribution

For more details, see the [Flutter iOS build documentation](https://docs.flutter.dev/deployment/ios).


## Project Structure

```
lib/
├── main_fixed.dart          # Main application entry point
├── auth_wrapper.dart        # Authentication flow wrapper
├── login_page.dart          # User login interface
├── signup_page.dart         # User registration interface
├── profile_page.dart        # User profile management
├── search_results_page.dart # Search results display
├── search_history_page.dart # Search history interface
├── models/
│   └── search_models.dart   # Data models for search functionality
├── services/
│   ├── auth_service_fixed.dart  # Authentication service
│   └── searxng_service.dart     # SearXNG search service
```


## Dependencies

Key dependencies used in this project:

- `http`: For making API calls to backend services
- `shared_preferences`: For persistent local storage
- `url_launcher`: For opening URLs in search results
- `json_annotation`: For JSON serialization


## API Endpoints

The app communicates with the following local services:

- **Authentication API**: `http://localhost:5000/api/auth`
- **Search API**: `http://localhost:5000/api/search`
- **SearXNG**: `http://localhost:8080/search`


## Development

### Code Generation

This project uses JSON serialization. To regenerate models after changes:

```bash
flutter pub run build_runner build
```

### Testing

Run tests:

```bash
flutter test
```


### Building for iOS Production

**iOS** (on macOS):
```bash
flutter build ios --release
```


## Troubleshooting (iOS)

### Common Issues

1. **Backend Connection Failed**:
   - Ensure your backend server is running on `localhost:5000`
   - Check firewall settings if running in a container

2. **SearXNG Not Responding**:
   - Verify SearXNG is running on `localhost:8080`
   - Check SearXNG configuration and logs


3. **Flutter Doctor Issues**:
   - Run `flutter doctor` and resolve any reported issues
   - Ensure Xcode and iOS SDK are properly installed


4. **Build Failures**:
   - Run `flutter clean` then `flutter pub get`
   - Run `cd ios && pod install && cd ..`
   - Check for dependency conflicts

### Debug Mode

Enable debug logging by setting the debug flag in the app settings or checking console output during development.


## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin feature/your-feature`
5. Submit a pull request


## License

This project is private and not intended for public distribution.


## Support

For support or questions, please contact the development team or create an issue in the repository.