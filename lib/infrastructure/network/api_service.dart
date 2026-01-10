import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import '../../domain/models/user_model.dart';
import '../../domain/models/reservation_model.dart';
import '../../domain/models/location_model.dart';
import '../../domain/models/api_response.dart';
import 'dio_client.dart';

/// API Service - .NET Backend Integration
/// Base URL: http://localhost:5088 (development)
/// Endpoints: /api/v1/*

class ApiService {
  /// POST /auth/logout
  Future<void> logout(String token) async {
    try {
      await _dio.post(
        '/auth/logout',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
    } catch (e) {
      throw _handleError(e);
    }
  }
  final Dio _dio;

  static String get _baseUrl {
    if (kIsWeb) {
      return 'http://localhost:5088/api/v1';
    }
    try {
      if (Platform.isAndroid) {
        // Android emülatörü için
        return 'http://10.0.2.2:5088/api/v1';
      }
    } catch (_) {}
    // Diğer platformlar (iOS, macOS, Windows, Linux)
    return 'http://localhost:5088/api/v1';
  }

  ApiService(this._dio) {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
  }

  /// Set authorization token
  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  /// Clear authorization token
  void clearAuthToken() {
    _dio.options.headers.remove('Authorization');
  }

  // ============================================================================
  // AUTH ENDPOINTS
  // ============================================================================

  /// POST /auth/login
  /// Login user and get JWT token
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return LoginResponse.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// POST /auth/register
  /// Register new user
  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/register',
        data: {
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
        },
      );
      return response.data;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// POST /auth/refresh-token
  /// Refresh JWT token
  Future<RefreshTokenResponse> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.post(
        '/auth/refresh-token',
        data: {'refreshToken': refreshToken},
      );
      return RefreshTokenResponse.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  // ============================================================================
  // RESERVATIONS ENDPOINTS
  // ============================================================================

  /// POST /reservations
  /// Create new reservation
  Future<ReservationDto> createReservation({
    required String resourceId,
    required String resourceType,
    required String startsAt,
    required String endsAt,
  }) async {
    try {
      final response = await _dio.post(
        '/reservations',
        data: {
          'resourceId': resourceId,
          'resourceType': resourceType,
          'startsAt': startsAt,
          'endsAt': endsAt,
        },
      );
      return ReservationDto.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// GET /reservations
  /// Get reservations with optional filters
  Future<List<ReservationDto>> getReservations({
    String? userId,
    String? from,
    String? to,
    String? status,
  }) async {
    try {
      final response = await _dio.get(
        '/reservations',
        queryParameters: {
          if (userId != null) 'userId': userId,
          if (from != null) 'from': from,
          if (to != null) 'to': to,
          if (status != null) 'status': status,
        },
      );
      return (response.data as List)
          .map((e) => ReservationDto.fromJson(e))
          .toList();
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// GET /reservations/{id}
  /// Get single reservation by ID
  Future<ReservationDto> getReservationById(String id) async {
    try {
      final response = await _dio.get('/reservations/$id');
      return ReservationDto.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// PATCH /reservations/{id}
  /// Update reservation
  Future<ReservationDto> updateReservation({
    required String id,
    String? resourceType,
    String? resourceId,
    String? startsAt,
    String? endsAt,
    String? status,
  }) async {
    try {
      final response = await _dio.patch(
        '/reservations/$id',
        data: {
          if (resourceType != null) 'resourceType': resourceType,
          if (resourceId != null) 'resourceId': resourceId,
          if (startsAt != null) 'startsAt': startsAt,
          if (endsAt != null) 'endsAt': endsAt,
          if (status != null) 'status': status,
        },
      );
      return ReservationDto.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// DELETE /reservations/{id}
  /// Delete reservation
  Future<void> deleteReservation(String id) async {
    try {
      await _dio.delete('/reservations/$id');
    } catch (e) {
      throw _handleError(e);
    }
  }

  // ============================================================================
  // USERS ENDPOINTS
  // ============================================================================

  /// GET /users with filters and pagination
  /// Get all users with filtering options (admin only)
  Future<UsersListResponse> getUsersWithFilters({
    String? search,
    String? role,
    String? status,
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final response = await _dio.get(
        '/users',
        queryParameters: {
          if (search != null && search.isNotEmpty) 'search': search,
          if (role != null && role.isNotEmpty) 'role': role,
          if (status != null && status.isNotEmpty) 'status': status,
          'page': page,
          'pageSize': pageSize,
        },
      );
      return UsersListResponse.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// GET /users
  /// Get all users (admin only)
  Future<List<UserDto>> getUsers() async {
    try {
      final response = await _dio.get('/users');
      final data = response.data;
      if (data is Map && data.containsKey('data')) {
        return (data['data'] as List).map((e) => UserDto.fromJson(e)).toList();
      }
      return (data as List).map((e) => UserDto.fromJson(e)).toList();
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// GET /users/roles
  /// Get available user roles
  Future<List<String>> getUserRoles() async {
    try {
      final response = await _dio.get('/users/roles');
      return List<String>.from(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// POST /users
  /// Create new user (admin only)
  Future<UserDto> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String role,
    String? password,
    String? department,
    String? phoneNumber,
    String? jobTitle,
  }) async {
    try {
      final response = await _dio.post(
        '/users',
        data: {
          'name': '$firstName $lastName',
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'role': role,
          if (password != null && password.isNotEmpty) 'password': password,
          if (department != null) 'department': department,
          if (phoneNumber != null) 'phoneNumber': phoneNumber,
          if (jobTitle != null) 'jobTitle': jobTitle,
        },
      );
      return UserDto.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// GET /users/{id}
  /// Get user by ID
  Future<UserDto> getUserById(String id) async {
    try {
      final response = await _dio.get('/users/$id');
      return UserDto.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// GET /users/me
  /// Get current user profile
  Future<UserDto> getCurrentUser() async {
    try {
      final response = await _dio.get('/users/me');
      return UserDto.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// PUT /users/{id}
  /// Update user with full data
  Future<UserDto> updateUserFull({
    required String id,
    String? firstName,
    String? lastName,
    String? email,
    String? role,
    String? department,
    String? phoneNumber,
    String? jobTitle,
    String? password,
  }) async {
    try {
      final data = <String, dynamic>{};
      if (firstName != null && lastName != null) {
        data['name'] = '$firstName $lastName';
      }
      if (email != null) data['email'] = email;
      if (role != null) data['role'] = role;
      if (department != null) data['department'] = department;
      if (phoneNumber != null) data['phoneNumber'] = phoneNumber;
      if (jobTitle != null) data['jobTitle'] = jobTitle;
      if (password != null && password.isNotEmpty) data['password'] = password;
      
      final response = await _dio.put('/users/$id', data: data);
      return UserDto.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// PATCH /users/{id}
  /// Update user
  Future<UserDto> updateUser({
    required String id,
    String? firstName,
    String? lastName,
    String? email,
    String? role,
  }) async {
    try {
      final response = await _dio.patch(
        '/users/$id',
        data: {
          if (firstName != null) 'firstName': firstName,
          if (lastName != null) 'lastName': lastName,
          if (email != null) 'email': email,
          if (role != null) 'role': role,
        },
      );
      return UserDto.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// DELETE /users/{id}
  /// Delete user (admin only)
  Future<void> deleteUser(String id) async {
    try {
      await _dio.delete('/users/$id');
    } catch (e) {
      throw _handleError(e);
    }
  }

  // ============================================================================
  // LOCATIONS ENDPOINTS
  // ============================================================================

  /// GET /locations
  /// Get all locations
  Future<List<LocationDto>> getLocations() async {
    try {
      final response = await _dio.get('/locations');
      return (response.data as List)
          .map((e) => LocationDto.fromJson(e))
          .toList();
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// POST /locations
  /// Create new location
  Future<LocationDto> createLocation({
    required String name,
    required String address,
    String? description,
  }) async {
    try {
      final response = await _dio.post(
        '/locations',
        data: {
          'name': name,
          'address': address,
          if (description != null) 'description': description,
        },
      );
      return LocationDto.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// GET /locations/{id}
  /// Get location by ID
  Future<LocationDto> getLocationById(String id) async {
    try {
      final response = await _dio.get('/locations/$id');
      return LocationDto.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// PATCH /locations/{id}
  /// Update location
  Future<LocationDto> updateLocation({
    required String id,
    String? name,
    String? address,
    String? description,
  }) async {
    try {
      final response = await _dio.patch(
        '/locations/$id',
        data: {
          if (name != null) 'name': name,
          if (address != null) 'address': address,
          if (description != null) 'description': description,
        },
      );
      return LocationDto.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// DELETE /locations/{id}
  /// Delete location
  Future<void> deleteLocation(String id) async {
    try {
      await _dio.delete('/locations/$id');
    } catch (e) {
      throw _handleError(e);
    }
  }

  // ============================================================================
  // NOTIFICATIONS ENDPOINTS
  // ============================================================================

  /// POST /notifications/send
  /// Send notification
  Future<Map<String, dynamic>> sendNotification({
    required List<String> recipientIds,
    required String message,
    String? title,
  }) async {
    try {
      final response = await _dio.post(
        '/notifications/send',
        data: {
          'recipientIds': recipientIds,
          'message': message,
          if (title != null) 'title': title,
        },
      );
      return response.data;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// GET /notifications
  /// Get notifications for current user
  Future<List<Map<String, dynamic>>> getNotifications() async {
    try {
      final response = await _dio.get('/notifications');
      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// PATCH /notifications/{id}/mark-as-read
  /// Mark notification as read
  Future<void> markNotificationAsRead(String id) async {
    try {
      await _dio.patch('/notifications/$id/mark-as-read');
    } catch (e) {
      throw _handleError(e);
    }
  }

  // ============================================================================
  // CHECK-IN ENDPOINTS
  // ============================================================================

  /// POST /checkin
  /// Check-in to a reservation
  Future<Map<String, dynamic>> checkIn({
    required String reservationId,
  }) async {
    try {
      final response = await _dio.post(
        '/checkin',
        data: {'reservationId': reservationId},
      );
      return response.data;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// GET /checkin/history
  /// Get check-in history
  Future<List<Map<String, dynamic>>> getCheckInHistory() async {
    try {
      final response = await _dio.get('/checkin/history');
      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  // ============================================================================
  // ANALYTICS ENDPOINTS
  // ============================================================================

  /// GET /analytics/stats
  /// Get system statistics
  Future<Map<String, dynamic>> getStatistics() async {
    try {
      final response = await _dio.get('/analytics/stats');
      return response.data;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// GET /analytics/trends
  /// Get trend data
  Future<Map<String, dynamic>> getTrends({
    String? period,
  }) async {
    try {
      final response = await _dio.get(
        '/analytics/trends',
        queryParameters: {
          if (period != null) 'period': period,
        },
      );
      return response.data;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // ============================================================================
  // RULES ENDPOINTS
  // ============================================================================

  /// GET /rules
  /// Get reservation rules
  Future<Map<String, dynamic>> getRules() async {
    try {
      final response = await _dio.get('/rules');
      return response.data;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// PATCH /rules
  /// Update reservation rules (admin only)
  Future<Map<String, dynamic>> updateRules({
    int? maxReservationDays,
    int? minReservationMinutes,
    int? maxReservationMinutes,
    bool? allowSameDayReservations,
  }) async {
    try {
      final response = await _dio.patch(
        '/rules',
        data: {
          if (maxReservationDays != null) 'maxReservationDays': maxReservationDays,
          if (minReservationMinutes != null) 'minReservationMinutes': minReservationMinutes,
          if (maxReservationMinutes != null) 'maxReservationMinutes': maxReservationMinutes,
          if (allowSameDayReservations != null) 'allowSameDayReservations': allowSameDayReservations,
        },
      );
      return response.data;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // ============================================================================
  // LOGS ENDPOINTS
  // ============================================================================

  /// GET /logs
  /// Get system logs (admin only)
  Future<List<Map<String, dynamic>>> getLogs({
    String? level,
    String? from,
    String? to,
  }) async {
    try {
      final response = await _dio.get(
        '/logs',
        queryParameters: {
          if (level != null) 'level': level,
          if (from != null) 'from': from,
          if (to != null) 'to': to,
        },
      );
      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  // ============================================================================
  // ERROR HANDLING
  // ============================================================================

  Exception _handleError(dynamic error) {
    if (error is DioException) {
      final statusCode = error.response?.statusCode ?? 0;
      final responseData = error.response?.data;
      
      // Try to parse API error response
      if (responseData is Map<String, dynamic>) {
        return ApiException(
          statusCode: statusCode,
          message: responseData['message'] ?? 'API Error',
          code: responseData['code'],
          errors: responseData['errors'],
          details: responseData['details'],
        );
      }

      // Fallback for different error types
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiException(
            statusCode: statusCode,
            message: 'Connection timeout - API server not responding',
            code: 'CONNECTION_TIMEOUT',
          );
        case DioExceptionType.sendTimeout:
          return ApiException(
            statusCode: statusCode,
            message: 'Request timeout - API server slow to respond',
            code: 'SEND_TIMEOUT',
          );
        case DioExceptionType.receiveTimeout:
          return ApiException(
            statusCode: statusCode,
            message: 'Response timeout - API server taking too long',
            code: 'RECEIVE_TIMEOUT',
          );
        case DioExceptionType.badResponse:
          return ApiException(
            statusCode: statusCode,
            message: 'API Error: ${error.message}',
            code: 'BAD_RESPONSE',
          );
        case DioExceptionType.cancel:
          return ApiException(
            statusCode: statusCode,
            message: 'Request cancelled',
            code: 'REQUEST_CANCELLED',
          );
        case DioExceptionType.unknown:
          return ApiException(
            statusCode: statusCode,
            message: 'Network error: ${error.message}',
            code: 'NETWORK_ERROR',
          );
        case DioExceptionType.badCertificate:
          return ApiException(
            statusCode: statusCode,
            message: 'SSL certificate error',
            code: 'SSL_ERROR',
          );
        case DioExceptionType.connectionError:
          return ApiException(
            statusCode: statusCode,
            message: 'Connection error - Check if API server is running',
            code: 'CONNECTION_ERROR',
          );
      }
    }
    
    // Unknown error type
    return ApiException(
      statusCode: 0,
      message: 'Unknown error: $error',
      code: 'UNKNOWN_ERROR',
    );
  }
}

/// Riverpod provider for ApiService
final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio);
});
