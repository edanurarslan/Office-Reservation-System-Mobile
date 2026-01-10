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

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}

/// Extension for UserDto to get status string
extension UserDtoExtension on UserDto {
  String get status => (isActive ?? true) ? 'active' : 'inactive';
  String get fullName => '$firstName $lastName';
}

/// Helper to parse User from API with flexible status handling
UserDto parseUserFromApi(Map<String, dynamic> json) {
  // Handle status field from API
  bool isActive = true;
  if (json.containsKey('status')) {
    final status = json['status'];
    if (status is bool) {
      isActive = status;
    } else if (status is String) {
      isActive = status.toLowerCase() == 'active';
    }
  } else if (json.containsKey('isActive')) {
    isActive = json['isActive'] as bool? ?? true;
  }
  
  return UserDto(
    id: json['id'] as String,
    email: json['email'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    role: UserRole.fromJson(json['role']),
    department: json['department'] as String?,
    jobTitle: json['jobTitle'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    isActive: isActive,
    managerId: json['managerId'] as String?,
  );
}

/// Users List Response - Paginated user list from API
class UsersListResponse {
  final List<UserDto> users;
  final int totalCount;
  final int page;
  final int pageSize;
  final int totalPages;

  UsersListResponse({
    required this.users,
    required this.totalCount,
    required this.page,
    required this.pageSize,
    required this.totalPages,
  });

  factory UsersListResponse.fromJson(Map<String, dynamic> json) {
    final dataList = json['data'] as List? ?? [];
    return UsersListResponse(
      users: dataList.map((e) => parseUserFromApi(e as Map<String, dynamic>)).toList(),
      totalCount: json['totalCount'] as int? ?? 0,
      page: json['page'] as int? ?? 1,
      pageSize: json['pageSize'] as int? ?? 10,
      totalPages: json['totalPages'] as int? ?? 1,
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
