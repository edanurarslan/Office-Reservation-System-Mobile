import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

// User Role enum - .NET UserRole karşılığı
enum UserRole {
  @JsonValue(1)
  employee('Employee', 1),
  @JsonValue(2)
  manager('Manager', 2),
  @JsonValue(3)
  admin('Admin', 3);

  final String value;
  final int intValue;
  const UserRole(this.value, this.intValue);

  /// Robust factory: accepts int (1,2,3) or string ("Admin", "admin", etc)
  factory UserRole.fromJson(dynamic json) {
    if (json is int) {
      return UserRole.values.firstWhere(
        (e) => e.intValue == json,
        orElse: () => UserRole.employee,
      );
    } else if (json is String) {
      final lower = json.toLowerCase();
      return UserRole.values.firstWhere(
        (e) => e.value.toLowerCase() == lower || e.name.toLowerCase() == lower,
        orElse: () => UserRole.employee,
      );
    }
    return UserRole.employee;
  }

  dynamic toJson() => intValue;
}

/// User DTO - Login ve API responses için
@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required UserRole role,
    String? department,
    String? jobTitle,
    String? phoneNumber,
    bool? isActive,
    String? managerId,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      role: UserRole.fromJson(json['role']),
      department: json['department'] as String?,
      jobTitle: json['jobTitle'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      isActive: json['isActive'] as bool?,
      managerId: json['managerId'] as String?,
    );
  }
}

/// Login Response - .NET AuthController.Login() response structure
@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String accessToken,
    required String refreshToken,
    required int expiresIn,
    required String tokenType,
    required UserDto user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

/// Refresh Token Response
@freezed
class RefreshTokenResponse with _$RefreshTokenResponse {
  const factory RefreshTokenResponse({
    required String accessToken,
    required int expiresIn,
    required String tokenType,
  }) = _RefreshTokenResponse;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);
}

/// Login Request - .NET LoginRequest record karşılığı
@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

/// Refresh Token Request - .NET RefreshTokenRequest record karşılığı
@freezed
class RefreshTokenRequest with _$RefreshTokenRequest {
  const factory RefreshTokenRequest({
    required String refreshToken,
  }) = _RefreshTokenRequest;

  factory RefreshTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestFromJson(json);
}
