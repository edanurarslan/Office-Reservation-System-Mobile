/// API Configuration Constants
class ApiConstants {
  // Base URLs
  static const String baseUrl = 'http://localhost:5088';
  static const String apiVersion = 'v1';
  static const String apiPrefix = '/api/$apiVersion';
  
  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
  
  // Auth Endpoints
  static const String login = '$apiPrefix/auth/login';
  static const String refreshToken = '$apiPrefix/auth/refresh-token';
  static const String validateToken = '$apiPrefix/auth/validate-token';
  
  // User Endpoints
  static const String users = '$apiPrefix/users';
  static String userById(String id) => '$users/$id';
  
  // Reservation Endpoints
  static const String reservations = '$apiPrefix/reservations';
  static String reservationById(String id) => '$reservations/$id';
  
  // Location Endpoints
  static const String locations = '$apiPrefix/locations';
  static String locationById(String id) => '$locations/$id';
  static String floorsByLocation(String locationId) => '$locations/$locationId/floors';
  static const String desks = '/desks';
  static const String rooms = '/rooms';
  
  // Floor & Zone Endpoints
  static String zonesByFloor(String floorId) => '/floors/$floorId/zones';
  
  // Other Endpoints
  static const String analytics = '$apiPrefix/analytics';
  static const String notifications = '$apiPrefix/notifications';
  static const String checkin = '$apiPrefix/checkin';
  static const String logs = '$apiPrefix/logs';
  static const String rules = '$apiPrefix/rules';
  static const String health = '$apiPrefix/health';
  
  // Headers
  static const String headerAuthorization = 'Authorization';
  static const String headerContentType = 'Content-Type';
  static const String headerAccept = 'Accept';
  
  // Content Types
  static const String contentTypeJson = 'application/json';
  
  // Token
  static const String bearerPrefix = 'Bearer';
}
