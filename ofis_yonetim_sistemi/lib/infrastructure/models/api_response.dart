import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

/// Generic API Response wrapper
@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required bool success,
    T? data,
    String? message,
    ApiError? error,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}

/// API Error Model
@freezed
class ApiError with _$ApiError {
  const factory ApiError({
    required String code,
    required String message,
    Map<String, dynamic>? details,
  }) = _ApiError;

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);
}

/// Login Request
@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    @JsonKey(name: 'Email') required String email,
    @JsonKey(name: 'Password') required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

/// Login Response
@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'AccessToken') required String accessToken,
    @JsonKey(name: 'RefreshToken') required String refreshToken,
    @JsonKey(name: 'ExpiresIn') required int expiresIn,
    @JsonKey(name: 'TokenType') required String tokenType,
    @JsonKey(name: 'User') required UserDto user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

/// User DTO (API)
@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    @JsonKey(name: 'Id') required String id,
    @JsonKey(name: 'Email') required String email,
    @JsonKey(name: 'FirstName') required String firstName,
    @JsonKey(name: 'LastName') required String lastName,
    @JsonKey(name: 'Role') required String role,
    @JsonKey(name: 'Department') String? department,
    @JsonKey(name: 'JobTitle') String? jobTitle,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}

/// Reservation DTO (API)
@freezed
class ReservationDto with _$ReservationDto {
  const factory ReservationDto({
    @JsonKey(name: 'Id') required String id,
    @JsonKey(name: 'ResourceType') required String resourceType,
    @JsonKey(name: 'ResourceId') required String resourceId,
    @JsonKey(name: 'StartsAt') required String startsAt,
    @JsonKey(name: 'EndsAt') required String endsAt,
    @JsonKey(name: 'Status') required String status,
    @JsonKey(name: 'Meta') Map<String, dynamic>? meta,
  }) = _ReservationDto;

  factory ReservationDto.fromJson(Map<String, dynamic> json) =>
      _$ReservationDtoFromJson(json);
}

/// Create Reservation Request
@freezed
class CreateReservationRequest with _$CreateReservationRequest {
  const factory CreateReservationRequest({
    @JsonKey(name: 'ResourceType') required String resourceType,
    @JsonKey(name: 'ResourceId') required String resourceId,
    @JsonKey(name: 'StartsAt') required String startsAt,
    @JsonKey(name: 'EndsAt') required String endsAt,
    @JsonKey(name: 'Meta') Map<String, dynamic>? meta,
  }) = _CreateReservationRequest;

  factory CreateReservationRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateReservationRequestFromJson(json);
}

/// Update Reservation Request
@freezed
class UpdateReservationRequest with _$UpdateReservationRequest {
  const factory UpdateReservationRequest({
    @JsonKey(name: 'ResourceType') String? resourceType,
    @JsonKey(name: 'ResourceId') String? resourceId,
    @JsonKey(name: 'StartsAt') String? startsAt,
    @JsonKey(name: 'EndsAt') String? endsAt,
    @JsonKey(name: 'Status') String? status,
    @JsonKey(name: 'Meta') Map<String, dynamic>? meta,
  }) = _UpdateReservationRequest;

  factory UpdateReservationRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateReservationRequestFromJson(json);
}

/// Location DTO
@freezed
class LocationDto with _$LocationDto {
  const factory LocationDto({
    @JsonKey(name: 'Id') required String id,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'Address') String? address,
  }) = _LocationDto;

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);
}

/// Desk DTO
@freezed
class DeskDto with _$DeskDto {
  const factory DeskDto({
    @JsonKey(name: 'Id') required String id,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'ZoneId') required String zoneId,
    @JsonKey(name: 'Features') List<String>? features,
  }) = _DeskDto;

  factory DeskDto.fromJson(Map<String, dynamic> json) =>
      _$DeskDtoFromJson(json);
}

/// Room DTO
@freezed
class RoomDto with _$RoomDto {
  const factory RoomDto({
    @JsonKey(name: 'Id') required String id,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'LocationId') required String locationId,
    @JsonKey(name: 'Capacity') required int capacity,
  }) = _RoomDto;

  factory RoomDto.fromJson(Map<String, dynamic> json) =>
      _$RoomDtoFromJson(json);
}
