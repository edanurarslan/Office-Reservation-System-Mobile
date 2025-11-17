import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_model.freezed.dart';
part 'reservation_model.g.dart';

/// Reservation Status enum - .NET ReservationStatus karşılığı
enum ReservationStatus {
  @JsonValue(1)
  pending('Pending'),
  @JsonValue(2)
  confirmed('Confirmed'),
  @JsonValue(3)
  checkedIn('CheckedIn'),
  @JsonValue(4)
  completed('Completed'),
  @JsonValue(5)
  cancelled('Cancelled'),
  @JsonValue(6)
  noShow('NoShow');

  final String value;
  const ReservationStatus(this.value);

  factory ReservationStatus.fromString(String value) {
    return ReservationStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => ReservationStatus.pending,
    );
  }

  String toJson() => value;
}

/// Resource Type enum - .NET ResourceType karşılığı
enum ResourceType {
  @JsonValue(1)
  desk('Desk'),
  @JsonValue(2)
  room('Room');

  final String value;
  const ResourceType(this.value);

  factory ResourceType.fromString(String value) {
    return ResourceType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => ResourceType.desk,
    );
  }

  String toJson() => value;
}

/// Reservation DTO - API responses için
@freezed
class ReservationDto with _$ReservationDto {
  const factory ReservationDto({
    required String id,
    required String userId,
    required ResourceType resourceType,
    required String resourceId,
    required DateTime startsAt,
    required DateTime endsAt,
    required ReservationStatus status,
    String? notes,
    String? purpose,
    int? expectedAttendees,
    DateTime? checkInAt,
    DateTime? checkOutAt,
    String? cancellationReason,
    DateTime? cancelledAt,
    bool? isRecurring,
    String? recurrencePattern,
    String? parentReservationId,
  }) = _ReservationDto;

  factory ReservationDto.fromJson(Map<String, dynamic> json) =>
      _$ReservationDtoFromJson(json);
}

/// Create Reservation Request - .NET CreateReservationRequest class karşılığı
@freezed
class CreateReservationRequest with _$CreateReservationRequest {
  const factory CreateReservationRequest({
    required String resourceType,
    required String resourceId,
    required String startsAt,
    required String endsAt,
    String? notes,
    String? purpose,
    int? expectedAttendees,
    Map<String, dynamic>? meta,
  }) = _CreateReservationRequest;

  factory CreateReservationRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateReservationRequestFromJson(json);
}

/// Update Reservation Request - .NET UpdateReservationRequest class karşılığı
@freezed
class UpdateReservationRequest with _$UpdateReservationRequest {
  const factory UpdateReservationRequest({
    String? resourceType,
    String? resourceId,
    String? startsAt,
    String? endsAt,
    String? status,
    String? notes,
    String? purpose,
    int? expectedAttendees,
    Map<String, dynamic>? meta,
  }) = _UpdateReservationRequest;

  factory UpdateReservationRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateReservationRequestFromJson(json);
}
