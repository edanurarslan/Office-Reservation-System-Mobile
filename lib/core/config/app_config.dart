/// Application configuration management
/// Parallel to .NET appsettings.json and Environment-based configuration

/// API Configuration
class ApiConfig {
  /// Base URL for API
  static const String baseUrl = 'http://localhost:5088/api/v1';

  /// Connect timeout in seconds
  static const int connectTimeout = 30;

  /// Receive timeout in seconds
  static const int receiveTimeout = 30;

  /// Send timeout in seconds
  static const int sendTimeout = 30;

  /// Maximum retries
  static const int maxRetries = 3;

  /// Retry delay in milliseconds
  static const int retryDelayMs = 1000;

  /// API endpoints
  static const String authLogin = '/auth/login';
  static const String authRefresh = '/auth/refresh-token';
  static const String authValidate = '/auth/validate-token';

  static const String reservations = '/reservations';
  static const String users = '/users';
  static const String locations = '/locations';
  static const String checkIns = '/check-ins';
  static const String notifications = '/notifications';
  static const String analytics = '/analytics';
  static const String logs = '/logs';
  static const String rules = '/rules';
}

/// App Configuration
class AppConfig {
  /// App name
  static const String appName = 'Ofis Yönetim Sistemi';

  /// App version
  static const String appVersion = '1.0.0';

  /// Build number
  static const String buildNumber = '1';

  /// Environment
  static const String environment = 'development';

  /// Enable logging
  static const bool enableLogging = true;

  /// Enable analytics
  static const bool enableAnalytics = true;

  /// Enable crash reporting
  static const bool enableCrashReporting = true;

  /// Token expiry in hours
  static const int tokenExpiryHours = 24;

  /// Refresh token expiry in days
  static const int refreshTokenExpiryDays = 30;

  /// Session timeout in minutes
  static const int sessionTimeoutMinutes = 30;

  /// Max login attempts
  static const int maxLoginAttempts = 5;

  /// Lockout duration in minutes
  static const int lockoutDurationMinutes = 15;
}

/// Storage Configuration
class StorageConfig {
  /// Database name
  static const String dbName = 'ofis_yonetim_sistemi';

  /// Database version
  static const int dbVersion = 1;

  /// Enable encryption
  static const bool enableEncryption = true;

  /// Token storage key
  static const String tokenKey = 'auth_token';

  /// Refresh token storage key
  static const String refreshTokenKey = 'refresh_token';

  /// User data storage key
  static const String userDataKey = 'user_data';

  /// Theme storage key
  static const String themeKey = 'theme_preference';
}

/// Feature flags for feature toggling
class FeatureFlags {
  /// Enable real API calls
  static const bool useRealApi = false;

  /// Enable offline mode
  static const bool enableOfflineMode = true;

  /// Enable push notifications
  static const bool enablePushNotifications = false;

  /// Enable analytics
  static const bool enableDetailedAnalytics = false;

  /// Enable debug mode
  static const bool enableDebugMode = true;

  /// Enable performance monitoring
  static const bool enablePerformanceMonitoring = false;
}

/// Environment-specific configuration
class EnvironmentConfig {
  static const bool isDevelopment = true;
  static const bool isStaging = false;
  static const bool isProduction = false;

  static String get environmentName {
    if (isDevelopment) return 'Development';
    if (isStaging) return 'Staging';
    if (isProduction) return 'Production';
    return 'Unknown';
  }
}

/// Logging configuration
class LoggingConfig {
  /// Log level
  static const String logLevel = 'debug'; // debug, info, warning, error

  /// Log to console
  static const bool logToConsole = true;

  /// Log to file
  static const bool logToFile = false;

  /// Max log file size in MB
  static const int maxLogFileSizeMb = 10;

  /// Max log files to keep
  static const int maxLogFiles = 5;

  /// Log directory path (will be set at runtime)
  static late String logDirectoryPath;

  /// Log sensitive data (passwords, tokens, etc.)
  static const bool logSensitiveData = false;
}

/// Security configuration
class SecurityConfig {
  /// Enable SSL pinning
  static const bool enableSslPinning = false;

  /// Enable certificate validation
  static const bool validateCertificates = true;

  /// Allowed SSL protocols
  static const List<String> allowedSSLProtocols = ['TLSv1.2', 'TLSv1.3'];

  /// Enable token encryption
  static const bool encryptTokens = true;

  /// Password minimum length
  static const int passwordMinLength = 6;

  /// Require uppercase in password
  static const bool requirePasswordUppercase = false;

  /// Require numbers in password
  static const bool requirePasswordNumbers = false;

  /// Require special chars in password
  static const bool requirePasswordSpecialChars = false;
}

/// Notification configuration
class NotificationConfig {
  /// Enable in-app notifications
  static const bool enableInAppNotifications = true;

  /// Enable push notifications
  static const bool enablePushNotifications = false;

  /// Enable email notifications
  static const bool enableEmailNotifications = false;

  /// Notification timeout in seconds
  static const int notificationTimeoutSeconds = 5;
}

/// Analytics configuration
class AnalyticsConfig {
  /// Analytics service endpoint
  static const String analyticsEndpoint = '/api/v1/analytics';

  /// Batch size for analytics events
  static const int batchSize = 20;

  /// Flush interval in seconds
  static const int flushIntervalSeconds = 30;

  /// Enable session tracking
  static const bool enableSessionTracking = true;

  /// Enable crash reporting
  static const bool enableCrashReporting = true;

  /// Enable performance monitoring
  static const bool enablePerformanceMonitoring = false;
}

/// Permission configuration
class PermissionConfig {
  /// Request location permission
  static const bool requestLocationPermission = false;

  /// Request camera permission
  static const bool requestCameraPermission = false;

  /// Request microphone permission
  static const bool requestMicrophonePermission = false;

  /// Request contacts permission
  static const bool requestContactsPermission = false;

  /// Request calendar permission
  static const bool requestCalendarPermission = false;
}
