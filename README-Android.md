# Golligog Flutter UI (Android)

A modern, privacy-focused search engine application built with Flutter, featuring user authentication and a clean, intuitive interface inspired by popular search engines. This guide focuses on running and building the app for **Android**.

## Features

- **User Authentication**: Secure login and signup functionality with persistent sessions
- **Privacy-Focused Search**: Powered by SearXNG, a metasearch engine that aggregates results from multiple search engines
- **Search History**: Track and manage your search queries
- **User Profiles**: Personalized user experience with profile management
- **Responsive Design**: Clean, modern UI that works across different screen sizes
- **Local Backend Integration**: Connects to local backend services for authentication and additional features

## Prerequisites (Android)

Before running or building the Android app, ensure you have the following installed:

- **Flutter SDK** (version 3.9.0 or higher)
- **Dart SDK** (included with Flutter)
- **Android Studio** with Android SDK and emulator (or physical device)
- **Java Development Kit (JDK)** (version 11 or higher)
- **Backend Server**: A local backend server running on `http://localhost:5000` (handles authentication and user data)
- **SearXNG Instance**: SearXNG search engine running on `http://localhost:8080` (provides search functionality)

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/BOCK-CHAIN/GolligogFlutterUI.git
   cd GolligogFlutterUI
   ```

2. **Configure environment variables**:
   - Copy the `.env.example` file to `.env`:
     ```bash
     copy .env.example .env
     ```
   - Edit the `.env` file and update the URLs if your services run on different ports:
     ```properties
     BACKEND_BASE_URL=http://localhost:5000
     SEARXNG_BASE_URL=http://localhost:8080
     ```

3. **Install Flutter dependencies**:
   ```bash
   flutter pub get
   ```

4. **Set up your development environment**:
   - Ensure Flutter is properly configured: `flutter doctor`
   - Set up Android Studio with Flutter plugins
   - Configure Android SDK paths if needed

## Running the Android App

### Prerequisites Setup

Before running the Flutter app, ensure your backend services are running at the URLs configured in your `.env` file:

1. **Start your backend server** (default: `localhost:5000`)
2. **Start SearXNG** (default: `localhost:8080`)

> **Note**: The app now reads these URLs from the `.env` file, so you can easily change them without modifying the code.

### Run the App on Android Emulator or Device

1. **Connect an Android device or start an emulator**:
   ```bash
   flutter devices
   flutter emulators
   flutter emulator --launch <emulator_name>
   ```

2. **Run the application**:
   ```bash
   flutter run
   ```

   Or run in release mode:
   ```bash
   flutter run --release
   ```

## Building an Android Release (APK/AAB) File

To create a release build for Android:

### Build APK (Android Package)

1. **Build the APK for release**:
   ```bash
   flutter build apk --release
   ```

   This generates an APK file at `build/app/outputs/flutter-apk/app-release.apk`

2. **Install the APK on a device**:
   ```bash
   flutter install --release
   ```

### Build AAB (Android App Bundle) - Recommended for Google Play

1. **Build the AAB for release**:
   ```bash
   flutter build appbundle --release
   ```

   This generates an AAB file at `build/app/outputs/bundle/release/app-release.aab`

2. **Upload to Google Play Console**:
   - Sign in to your Google Play Console
   - Create a new release or update an existing one
   - Upload the `app-release.aab` file
   - Complete the release process

### Signing the Release Build

For production builds, you'll need to sign your app:

1. **Create a keystore** (if you don't have one):
   ```bash
   keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```

2. **Configure signing in `android/key.properties`**:
   ```properties
   storePassword=<password from previous step>
   keyPassword=<password from previous step>
   keyAlias=upload
   storeFile=<location of the key store file, e.g. /Users/<user name>/upload-keystore.jks>
   ```

3. **Build with signing**:
   ```bash
   flutter build apk --release
   # or
   flutter build appbundle --release
   ```

For more details, see the [Flutter Android build documentation](https://docs.flutter.dev/deployment/android).

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
android/
├── app/
│   ├── build.gradle.kts     # Android app configuration
│   └── src/
│       └── main/
│           ├── AndroidManifest.xml
│           └── kotlin/
│               └── com/example/search_engine_app/
│                   └── MainActivity.kt
```

## Dependencies

Key dependencies used in this project:

- `http`: For making API calls to backend services
- `shared_preferences`: For persistent local storage
- `url_launcher`: For opening URLs in search results
- `json_annotation`: For JSON serialization

## Environment Configuration

The application uses a `.env` file to manage API endpoints. This allows you to easily change backend URLs without modifying the code.

### Environment Variables

Create a `.env` file in the root directory (you can copy from `.env.example`):

```properties
# Backend API Configuration
BACKEND_BASE_URL=http://localhost:5000

# SearXNG Configuration
SEARXNG_BASE_URL=http://localhost:8080
```

### Configuration Details

- **BACKEND_BASE_URL**: Base URL for your authentication and search backend API
- **SEARXNG_BASE_URL**: Base URL for your SearXNG instance

**Important Notes**:
- The `.env` file is excluded from version control (`.gitignore`)
- Use `.env.example` as a template for your local configuration
- After changing `.env`, restart the app for changes to take effect

## API Endpoints

The app communicates with the following services (configurable via `.env`):

- **Authentication API**: `{BACKEND_BASE_URL}/api/auth`
- **Search API**: `{BACKEND_BASE_URL}/api/search`
- **SearXNG**: `{SEARXNG_BASE_URL}/search`

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

### Building for Android Production

**Android APK**:
```bash
flutter build apk --release
```

**Android App Bundle (AAB)**:
```bash
flutter build appbundle --release
```

## Troubleshooting (Android)

### Common Issues

1. **Backend Connection Failed**:
   - Ensure your backend server is running on `localhost:5000`
   - Check firewall settings if running in a container

2. **SearXNG Not Responding**:
   - Verify SearXNG is running on `localhost:8080`
   - Check SearXNG configuration and logs

3. **Flutter Doctor Issues**:
   - Run `flutter doctor` and resolve any reported issues
   - Ensure Android SDK is properly installed and ANDROID_HOME is set

4. **Build Failures**:
   - Run `flutter clean` then `flutter pub get`
   - Check for dependency conflicts
   - Ensure Java JDK is installed and JAVA_HOME is set

5. **Emulator Issues**:
   - Restart Android Studio and emulator
   - Check SDK versions compatibility

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