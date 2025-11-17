import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../core/constants/api_constants.dart';

/// Auth Interceptor - Automatically adds JWT token to requests
class AuthInterceptor extends Interceptor {
  final Ref ref;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthInterceptor(this.ref);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip token for login and public endpoints
    if (_isPublicEndpoint(options.path)) {
      return handler.next(options);
    }

    // Get token from secure storage
    final token = await _storage.read(key: 'auth_token');
    
    if (token != null && token.isNotEmpty) {
      options.headers[ApiConstants.headerAuthorization] = 
          '${ApiConstants.bearerPrefix} $token';
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 Unauthorized - Token expired or invalid
    if (err.response?.statusCode == 401) {
      // Try to refresh token
      final refreshSuccess = await _attemptTokenRefresh();
      
      if (refreshSuccess) {
        // Retry the failed request with new token
        final opts = err.requestOptions;
        final token = await _storage.read(key: 'auth_token');
        opts.headers[ApiConstants.headerAuthorization] = 
            '${ApiConstants.bearerPrefix} $token';
        
        try {
          final dio = Dio();
          final response = await dio.request(
            opts.path,
            options: Options(
              method: opts.method,
              headers: opts.headers,
            ),
            data: opts.data,
            queryParameters: opts.queryParameters,
          );
          return handler.resolve(response);
        } catch (e) {
          return handler.reject(err);
        }
      } else {
        // Refresh failed, logout user
        await _storage.delete(key: 'auth_token');
        await _storage.delete(key: 'refresh_token');
        // Navigate to login - You can use GoRouter here
      }
    }

    return handler.next(err);
  }

  bool _isPublicEndpoint(String path) {
    final publicEndpoints = [
      ApiConstants.login,
      ApiConstants.refreshToken,
      ApiConstants.health,
    ];
    return publicEndpoints.any((endpoint) => path.contains(endpoint));
  }

  Future<bool> _attemptTokenRefresh() async {
    try {
      final refreshToken = await _storage.read(key: 'refresh_token');
      if (refreshToken == null) return false;

      final dio = Dio();
      final response = await dio.post(
        '${ApiConstants.baseUrl}${ApiConstants.refreshToken}',
        data: {'RefreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        final newAccessToken = response.data['AccessToken'];
        await _storage.write(key: 'auth_token', value: newAccessToken);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
