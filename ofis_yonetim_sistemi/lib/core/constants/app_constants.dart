class AppConstants {
  // API Configuration
  static const String baseUrl = 'https://api.example.com/api/v1';
  static const Duration requestTimeout = Duration(seconds: 30);
  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Storage Keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userKey = 'user_data';
  static const String settingsKey = 'app_settings';
  static const String filtersKey = 'filter_preferences';

  // QR Code Configuration
  static const Duration qrTokenValidityDuration = Duration(minutes: 15);
  static const int qrCodeSize = 200;
  static const int qrRefreshThreshold = 300; // seconds

  // UI Constants
  static const double minTouchTargetSize = 44.0;
  static const Duration snackBarDuration = Duration(seconds: 4);
  static const Duration animationDuration = Duration(milliseconds: 300);

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Auth Configuration
  static const String clientId = 'office-management-mobile';
  static const String redirectUri = 'com.example.ofis://oauth/callback';
  static const List<String> scopes = [
    'openid',
    'profile',
    'email',
    'reservations:read',
    'reservations:write',
    'resources:read'
  ];

  // Feature Flags
  static const bool enableOfflineMode = true;
  static const bool enableAnalytics = true;
  static const bool enablePushNotifications = true;
}