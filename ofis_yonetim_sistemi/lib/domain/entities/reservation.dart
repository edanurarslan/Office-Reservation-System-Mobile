import 'package:freezed_annotation/freezed_annotation.dart';
import 'resource.dart';

part 'reservation.freezed.dart';
part 'reservation.g.dart';

@freezed
class Reservation with _$Reservation {
  const factory Reservation({
    required String id,
    required String userId,
    required String resourceId,
    required String resourceName,
    required ResourceType resourceType,
    required DateTime startsAt,
    required DateTime endsAt,
    required ReservationStatus status,
    String? notes,
    DateTime? checkedInAt,
    DateTime? checkedOutAt,
    required DateTime createdAt,
    DateTime? updatedAt,
    String? qrToken,
    DateTime? qrTokenExpiresAt,
    Map<String, dynamic>? metadata,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, dynamic> json) => _$ReservationFromJson(json);
}

@freezed
class ReservationRequest with _$ReservationRequest {
  const factory ReservationRequest({
    required String resourceId,
    required ResourceType resourceType,
    required DateTime startsAt,
    required DateTime endsAt,
    String? notes,
  }) = _ReservationRequest;

  factory ReservationRequest.fromJson(Map<String, dynamic> json) => _$ReservationRequestFromJson(json);
}

enum ReservationStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('checked_in')
  checkedIn,
  @JsonValue('checked_out')
  checkedOut,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('expired')
  expired,
  @JsonValue('no_show')
  noShow,
}