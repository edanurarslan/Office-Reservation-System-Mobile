// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthTokenImpl _$$AuthTokenImplFromJson(Map<String, dynamic> json) =>
    _$AuthTokenImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      tokenType: json['tokenType'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
      scope: json['scope'] as String?,
      issuedAt: DateTime.parse(json['issuedAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$$AuthTokenImplToJson(_$AuthTokenImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
      'scope': instance.scope,
      'issuedAt': instance.issuedAt.toIso8601String(),
      'expiresAt': instance.expiresAt.toIso8601String(),
    };

_$QrTokenImpl _$$QrTokenImplFromJson(Map<String, dynamic> json) =>
    _$QrTokenImpl(
      token: json['token'] as String,
      reservationId: json['reservationId'] as String,
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      type: $enumDecode(_$QrTokenTypeEnumMap, json['type']),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$QrTokenImplToJson(_$QrTokenImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'reservationId': instance.reservationId,
      'expiresAt': instance.expiresAt.toIso8601String(),
      'type': _$QrTokenTypeEnumMap[instance.type]!,
      'metadata': instance.metadata,
    };

const _$QrTokenTypeEnumMap = {
  QrTokenType.checkIn: 'check_in',
  QrTokenType.checkOut: 'check_out',
  QrTokenType.access: 'access',
};

_$CheckInRequestImpl _$$CheckInRequestImplFromJson(Map<String, dynamic> json) =>
    _$CheckInRequestImpl(
      token: json['token'] as String,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      location: json['location'] as String?,
    );

Map<String, dynamic> _$$CheckInRequestImplToJson(
        _$CheckInRequestImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'timestamp': instance.timestamp?.toIso8601String(),
      'location': instance.location,
    };

_$CheckInResponseImpl _$$CheckInResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckInResponseImpl(
      reservationId: json['reservationId'] as String,
      success: json['success'] as bool,
      message: json['message'] as String?,
      checkedInAt: json['checkedInAt'] == null
          ? null
          : DateTime.parse(json['checkedInAt'] as String),
    );

Map<String, dynamic> _$$CheckInResponseImplToJson(
        _$CheckInResponseImpl instance) =>
    <String, dynamic>{
      'reservationId': instance.reservationId,
      'success': instance.success,
      'message': instance.message,
      'checkedInAt': instance.checkedInAt?.toIso8601String(),
    };
