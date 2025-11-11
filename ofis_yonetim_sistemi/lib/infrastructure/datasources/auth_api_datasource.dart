import 'package:dio/dio.dart';
import '../models/api_response.dart';
import '../../core/constants/api_constants.dart';

/// Authentication API Data Source
class AuthApiDataSource {
  final Dio dio;

  AuthApiDataSource(this.dio);

  /// Login user
  Future<LoginResponse> login(String email, String password) async {
    try {
      final response = await dio.post(
        ApiConstants.login,
        data: LoginRequest(email: email, password: password).toJson(),
      );

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Login failed',
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Invalid credentials');
      }
      throw Exception('Login failed: ${e.message}');
    }
  }

  /// Refresh access token
  Future<String> refreshToken(String refreshToken) async {
    try {
      final response = await dio.post(
        ApiConstants.refreshToken,
        data: {'RefreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        return response.data['AccessToken'] as String;
      } else {
        throw Exception('Token refresh failed');
      }
    } on DioException catch (e) {
      throw Exception('Token refresh failed: ${e.message}');
    }
  }

  /// Validate token
  Future<bool> validateToken(String token) async {
    try {
      final response = await dio.post(
        ApiConstants.validateToken,
        data: {'Token': token},
      );

      if (response.statusCode == 200) {
        return response.data['IsValid'] as bool;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
