import 'package:flutter_test/flutter_test.dart';
import 'package:search_engine_app/config/app_config.dart';

void main() {
  test('AppConfig loads environment variables', () async {
    // Load the environment variables
    await AppConfig.load();
    
    // Verify URLs are accessible
    expect(AppConfig.backendBaseUrl, isNotNull);
    expect(AppConfig.searxngBaseUrl, isNotNull);
    expect(AppConfig.backendAuthUrl, isNotNull);
    expect(AppConfig.backendSearchUrl, isNotNull);
    
    // Verify URLs contain expected values
    expect(AppConfig.backendBaseUrl, contains('http'));
    expect(AppConfig.searxngBaseUrl, contains('http'));
    
    print('Backend URL: ${AppConfig.backendBaseUrl}');
    print('SearXNG URL: ${AppConfig.searxngBaseUrl}');
    print('Auth URL: ${AppConfig.backendAuthUrl}');
    print('Search URL: ${AppConfig.backendSearchUrl}');
  });
}
