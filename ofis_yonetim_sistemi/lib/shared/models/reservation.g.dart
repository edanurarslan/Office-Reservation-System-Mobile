// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReservationImpl _$$ReservationImplFromJson(Map<String, dynamic> json) =>
    _$ReservationImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      resourceId: json['resourceId'] as String,
      resourceName: json['resourceName'] as String,
      resourceType: $enumDecode(_$ResourceTypeEnumMap, json['resourceType']),
      startsAt: DateTime.parse(json['startsAt'] as String),
      endsAt: DateTime.parse(json['endsAt'] as String),
      status: $enumDecode(_$ReservationStatusEnumMap, json['status']),
      notes: json['notes'] as String?,
      checkedInAt: json['checkedInAt'] == null
          ? null
          : DateTime.parse(json['checkedInAt'] as String),
      checkedOutAt: json['checkedOutAt'] == null
          ? null
          : DateTime.parse(json['checkedOutAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      qrToken: json['qrToken'] as String?,
      qrTokenExpiresAt: json['qrTokenExpiresAt'] == null
          ? null
          : DateTime.parse(json['qrTokenExpiresAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ReservationImplToJson(_$ReservationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'resourceId': instance.resourceId,
      'resourceName': instance.resourceName,
      'resourceType': _$ResourceTypeEnumMap[instance.resourceType]!,
      'startsAt': instance.startsAt.toIso8601String(),
      'endsAt': instance.endsAt.toIso8601String(),
      'status': _$ReservationStatusEnumMap[instance.status]!,
      'notes': instance.notes,
      'checkedInAt': instance.checkedInAt?.toIso8601String(),
      'checkedOutAt': instance.checkedOutAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'qrToken': instance.qrToken,
      'qrTokenExpiresAt': instance.qrTokenExpiresAt?.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$ResourceTypeEnumMap = {
  ResourceType.desk: 'desk',
  ResourceType.room: 'room',
  ResourceType.meetingRoom: 'meeting_room',
  ResourceType.phoneBooth: 'phone_booth',
  ResourceType.parkingSpace: 'parking_space',
};

const _$ReservationStatusEnumMap = {
  ReservationStatus.pending: 'pending',
  ReservationStatus.confirmed: 'confirmed',
  ReservationStatus.checkedIn: 'checked_in',
  ReservationStatus.checkedOut: 'checked_out',
  ReservationStatus.cancelled: 'cancelled',
  ReservationStatus.expired: 'expired',
  ReservationStatus.noShow: 'no_show',
};

_$ReservationRequestImpl _$$ReservationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ReservationRequestImpl(
      resourceId: json['resourceId'] as String,
      resourceType: $enumDecode(_$ResourceTypeEnumMap, json['resourceType']),
      startsAt: DateTime.parse(json['startsAt'] as String),
      endsAt: DateTime.parse(json['endsAt'] as String),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$ReservationRequestImplToJson(
        _$ReservationRequestImpl instance) =>
    <String, dynamic>{
      'resourceId': instance.resourceId,
      'resourceType': _$ResourceTypeEnumMap[instance.resourceType]!,
      'startsAt': instance.startsAt.toIso8601String(),
      'endsAt': instance.endsAt.toIso8601String(),
      'notes': instance.notes,
    };
