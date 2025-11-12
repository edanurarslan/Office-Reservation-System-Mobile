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
    required String email,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

/// Login Response
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

/// User DTO (API)
@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required String role,
    String? department,
    String? jobTitle,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}

/// Reservation DTO (API)
@freezed
class ReservationDto with _$ReservationDto {
  const factory ReservationDto({
    required String id,
    required String resourceType,
    required String resourceId,
    required String startsAt,
    required String endsAt,
    required String status,
    Map<String, dynamic>? meta,
  }) = _ReservationDto;

  factory ReservationDto.fromJson(Map<String, dynamic> json) =>
      _$ReservationDtoFromJson(json);
}

/// Create Reservation Request
@freezed
class CreateReservationRequest with _$CreateReservationRequest {
  const factory CreateReservationRequest({
    required String resourceType,
    required String resourceId,
    required String startsAt,
    required String endsAt,
    Map<String, dynamic>? meta,
  }) = _CreateReservationRequest;

  factory CreateReservationRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateReservationRequestFromJson(json);
}

/// Update Reservation Request
@freezed
class UpdateReservationRequest with _$UpdateReservationRequest {
  const factory UpdateReservationRequest({
    String? resourceType,
    String? resourceId,
    String? startsAt,
    String? endsAt,
    String? status,
    Map<String, dynamic>? meta,
  }) = _UpdateReservationRequest;

  factory UpdateReservationRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateReservationRequestFromJson(json);
}

/// Location DTO
@freezed
class LocationDto with _$LocationDto {
  const factory LocationDto({
    required String id,
    required String name,
    String? address,
  }) = _LocationDto;

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);
}

/// Desk DTO
@freezed
class DeskDto with _$DeskDto {
  const factory DeskDto({
    required String id,
    required String name,
    required String zoneId,
    List<String>? features,
  }) = _DeskDto;

  factory DeskDto.fromJson(Map<String, dynamic> json) =>
      _$DeskDtoFromJson(json);
}

/// Room DTO
@freezed
class RoomDto with _$RoomDto {
  const factory RoomDto({
    required String id,
    required String name,
    required String locationId,
    required int capacity,
  }) = _RoomDto;

  factory RoomDto.fromJson(Map<String, dynamic> json) =>
      _$RoomDtoFromJson(json);
}
