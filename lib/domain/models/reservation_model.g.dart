// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReservationDtoImpl _$$ReservationDtoImplFromJson(Map<String, dynamic> json) =>
    _$ReservationDtoImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      resourceType: $enumDecode(_$ResourceTypeEnumMap, json['resourceType']),
      resourceId: json['resourceId'] as String,
      startsAt: DateTime.parse(json['startsAt'] as String),
      endsAt: DateTime.parse(json['endsAt'] as String),
      status: $enumDecode(_$ReservationStatusEnumMap, json['status']),
      notes: json['notes'] as String?,
      purpose: json['purpose'] as String?,
      expectedAttendees: (json['expectedAttendees'] as num?)?.toInt(),
      checkInAt: json['checkInAt'] == null
          ? null
          : DateTime.parse(json['checkInAt'] as String),
      checkOutAt: json['checkOutAt'] == null
          ? null
          : DateTime.parse(json['checkOutAt'] as String),
      cancellationReason: json['cancellationReason'] as String?,
      cancelledAt: json['cancelledAt'] == null
          ? null
          : DateTime.parse(json['cancelledAt'] as String),
      isRecurring: json['isRecurring'] as bool?,
      recurrencePattern: json['recurrencePattern'] as String?,
      parentReservationId: json['parentReservationId'] as String?,
    );

Map<String, dynamic> _$$ReservationDtoImplToJson(
        _$ReservationDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'resourceType': instance.resourceType,
      'resourceId': instance.resourceId,
      'startsAt': instance.startsAt.toIso8601String(),
      'endsAt': instance.endsAt.toIso8601String(),
      'status': instance.status,
      'notes': instance.notes,
      'purpose': instance.purpose,
      'expectedAttendees': instance.expectedAttendees,
      'checkInAt': instance.checkInAt?.toIso8601String(),
      'checkOutAt': instance.checkOutAt?.toIso8601String(),
      'cancellationReason': instance.cancellationReason,
      'cancelledAt': instance.cancelledAt?.toIso8601String(),
      'isRecurring': instance.isRecurring,
      'recurrencePattern': instance.recurrencePattern,
      'parentReservationId': instance.parentReservationId,
    };

const _$ResourceTypeEnumMap = {
  ResourceType.desk: 1,
  ResourceType.room: 2,
};

const _$ReservationStatusEnumMap = {
  ReservationStatus.pending: 1,
  ReservationStatus.confirmed: 2,
  ReservationStatus.checkedIn: 3,
  ReservationStatus.completed: 4,
  ReservationStatus.cancelled: 5,
  ReservationStatus.noShow: 6,
};

_$CreateReservationRequestImpl _$$CreateReservationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateReservationRequestImpl(
      resourceType: json['resourceType'] as String,
      resourceId: json['resourceId'] as String,
      startsAt: json['startsAt'] as String,
      endsAt: json['endsAt'] as String,
      notes: json['notes'] as String?,
      purpose: json['purpose'] as String?,
      expectedAttendees: (json['expectedAttendees'] as num?)?.toInt(),
      meta: json['meta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CreateReservationRequestImplToJson(
        _$CreateReservationRequestImpl instance) =>
    <String, dynamic>{
      'resourceType': instance.resourceType,
      'resourceId': instance.resourceId,
      'startsAt': instance.startsAt,
      'endsAt': instance.endsAt,
      'notes': instance.notes,
      'purpose': instance.purpose,
      'expectedAttendees': instance.expectedAttendees,
      'meta': instance.meta,
    };

_$UpdateReservationRequestImpl _$$UpdateReservationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateReservationRequestImpl(
      resourceType: json['resourceType'] as String?,
      resourceId: json['resourceId'] as String?,
      startsAt: json['startsAt'] as String?,
      endsAt: json['endsAt'] as String?,
      status: json['status'] as String?,
      notes: json['notes'] as String?,
      purpose: json['purpose'] as String?,
      expectedAttendees: (json['expectedAttendees'] as num?)?.toInt(),
      meta: json['meta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$UpdateReservationRequestImplToJson(
        _$UpdateReservationRequestImpl instance) =>
    <String, dynamic>{
      'resourceType': instance.resourceType,
      'resourceId': instance.resourceId,
      'startsAt': instance.startsAt,
      'endsAt': instance.endsAt,
      'status': instance.status,
      'notes': instance.notes,
      'purpose': instance.purpose,
      'expectedAttendees': instance.expectedAttendees,
      'meta': instance.meta,
    };
