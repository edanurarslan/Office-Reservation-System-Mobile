// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiErrorImpl _$$ApiErrorImplFromJson(Map<String, dynamic> json) =>
    _$ApiErrorImpl(
      message: json['message'] as String,
      code: json['code'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      details: json['details'] as Map<String, dynamic>?,
      correlationId: json['correlationId'] as String?,
    );

Map<String, dynamic> _$$ApiErrorImplToJson(_$ApiErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'statusCode': instance.statusCode,
      'details': instance.details,
      'correlationId': instance.correlationId,
    };

_$FilterOptionsImpl _$$FilterOptionsImplFromJson(Map<String, dynamic> json) =>
    _$FilterOptionsImpl(
      locationId: json['locationId'] as String?,
      zoneId: json['zoneId'] as String?,
      floorId: json['floorId'] as String?,
      minCapacity: (json['minCapacity'] as num?)?.toInt(),
      maxCapacity: (json['maxCapacity'] as num?)?.toInt(),
      amenities: (json['amenities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      resourceTypes: (json['resourceTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$FilterOptionsImplToJson(_$FilterOptionsImpl instance) =>
    <String, dynamic>{
      'locationId': instance.locationId,
      'zoneId': instance.zoneId,
      'floorId': instance.floorId,
      'minCapacity': instance.minCapacity,
      'maxCapacity': instance.maxCapacity,
      'amenities': instance.amenities,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'resourceTypes': instance.resourceTypes,
    };
