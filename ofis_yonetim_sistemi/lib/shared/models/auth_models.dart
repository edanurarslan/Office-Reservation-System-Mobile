import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@freezed
class AuthToken with _$AuthToken {
  const factory AuthToken({
    required String accessToken,
    required String refreshToken,
    required String tokenType,
    required int expiresIn,
    String? scope,
    required DateTime issuedAt,
    required DateTime expiresAt,
  }) = _AuthToken;

  factory AuthToken.fromJson(Map<String, dynamic> json) => _$AuthTokenFromJson(json);
}

@freezed
class QrToken with _$QrToken {
  const factory QrToken({
    required String token,
    required String reservationId,
    required DateTime expiresAt,
    required QrTokenType type,
    Map<String, dynamic>? metadata,
  }) = _QrToken;

  factory QrToken.fromJson(Map<String, dynamic> json) => _$QrTokenFromJson(json);
}

@freezed
class CheckInRequest with _$CheckInRequest {
  const factory CheckInRequest({
    required String token,
    DateTime? timestamp,
    String? location,
  }) = _CheckInRequest;

  factory CheckInRequest.fromJson(Map<String, dynamic> json) => _$CheckInRequestFromJson(json);
}

@freezed
class CheckInResponse with _$CheckInResponse {
  const factory CheckInResponse({
    required String reservationId,
    required bool success,
    String? message,
    DateTime? checkedInAt,
  }) = _CheckInResponse;

  factory CheckInResponse.fromJson(Map<String, dynamic> json) => _$CheckInResponseFromJson(json);
}

enum QrTokenType {
  @JsonValue('check_in')
  checkIn,
  @JsonValue('check_out')
  checkOut,
  @JsonValue('access')
  access,
}