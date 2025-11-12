// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl<T> _$$ApiResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiResponseImpl<T>(
      success: json['success'] as bool,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      message: json['message'] as String?,
      error: json['error'] == null
          ? null
          : ApiError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ApiResponseImplToJson<T>(
  _$ApiResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'message': instance.message,
      'error': instance.error,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

_$ApiErrorImpl _$$ApiErrorImplFromJson(Map<String, dynamic> json) =>
    _$ApiErrorImpl(
      code: json['code'] as String,
      message: json['message'] as String,
      details: json['details'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ApiErrorImplToJson(_$ApiErrorImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'details': instance.details,
    };

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
      tokenType: json['tokenType'] as String,
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
      'tokenType': instance.tokenType,
      'user': instance.user,
    };

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      role: json['role'] as String,
      department: json['department'] as String?,
      jobTitle: json['jobTitle'] as String?,
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'role': instance.role,
      'department': instance.department,
      'jobTitle': instance.jobTitle,
    };

_$ReservationDtoImpl _$$ReservationDtoImplFromJson(Map<String, dynamic> json) =>
    _$ReservationDtoImpl(
      id: json['id'] as String,
      resourceType: json['resourceType'] as String,
      resourceId: json['resourceId'] as String,
      startsAt: json['startsAt'] as String,
      endsAt: json['endsAt'] as String,
      status: json['status'] as String,
      meta: json['meta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ReservationDtoImplToJson(
        _$ReservationDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resourceType': instance.resourceType,
      'resourceId': instance.resourceId,
      'startsAt': instance.startsAt,
      'endsAt': instance.endsAt,
      'status': instance.status,
      'meta': instance.meta,
    };

_$CreateReservationRequestImpl _$$CreateReservationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateReservationRequestImpl(
      resourceType: json['resourceType'] as String,
      resourceId: json['resourceId'] as String,
      startsAt: json['startsAt'] as String,
      endsAt: json['endsAt'] as String,
      meta: json['meta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CreateReservationRequestImplToJson(
        _$CreateReservationRequestImpl instance) =>
    <String, dynamic>{
      'resourceType': instance.resourceType,
      'resourceId': instance.resourceId,
      'startsAt': instance.startsAt,
      'endsAt': instance.endsAt,
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
      'meta': instance.meta,
    };

_$LocationDtoImpl _$$LocationDtoImplFromJson(Map<String, dynamic> json) =>
    _$LocationDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$LocationDtoImplToJson(_$LocationDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
    };

_$DeskDtoImpl _$$DeskDtoImplFromJson(Map<String, dynamic> json) =>
    _$DeskDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      zoneId: json['zoneId'] as String,
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$DeskDtoImplToJson(_$DeskDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'zoneId': instance.zoneId,
      'features': instance.features,
    };

_$RoomDtoImpl _$$RoomDtoImplFromJson(Map<String, dynamic> json) =>
    _$RoomDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      locationId: json['locationId'] as String,
      capacity: (json['capacity'] as num).toInt(),
    );

Map<String, dynamic> _$$RoomDtoImplToJson(_$RoomDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'locationId': instance.locationId,
      'capacity': instance.capacity,
    };
