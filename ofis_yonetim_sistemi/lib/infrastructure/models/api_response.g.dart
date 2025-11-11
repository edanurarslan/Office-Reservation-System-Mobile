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
      email: json['Email'] as String,
      password: json['Password'] as String,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'Email': instance.email,
      'Password': instance.password,
    };

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      accessToken: json['AccessToken'] as String,
      refreshToken: json['RefreshToken'] as String,
      expiresIn: (json['ExpiresIn'] as num).toInt(),
      tokenType: json['TokenType'] as String,
      user: UserDto.fromJson(json['User'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'AccessToken': instance.accessToken,
      'RefreshToken': instance.refreshToken,
      'ExpiresIn': instance.expiresIn,
      'TokenType': instance.tokenType,
      'User': instance.user,
    };

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      id: json['Id'] as String,
      email: json['Email'] as String,
      firstName: json['FirstName'] as String,
      lastName: json['LastName'] as String,
      role: json['Role'] as String,
      department: json['Department'] as String?,
      jobTitle: json['JobTitle'] as String?,
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Email': instance.email,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'Role': instance.role,
      'Department': instance.department,
      'JobTitle': instance.jobTitle,
    };

_$ReservationDtoImpl _$$ReservationDtoImplFromJson(Map<String, dynamic> json) =>
    _$ReservationDtoImpl(
      id: json['Id'] as String,
      resourceType: json['ResourceType'] as String,
      resourceId: json['ResourceId'] as String,
      startsAt: json['StartsAt'] as String,
      endsAt: json['EndsAt'] as String,
      status: json['Status'] as String,
      meta: json['Meta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ReservationDtoImplToJson(
        _$ReservationDtoImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ResourceType': instance.resourceType,
      'ResourceId': instance.resourceId,
      'StartsAt': instance.startsAt,
      'EndsAt': instance.endsAt,
      'Status': instance.status,
      'Meta': instance.meta,
    };

_$CreateReservationRequestImpl _$$CreateReservationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateReservationRequestImpl(
      resourceType: json['ResourceType'] as String,
      resourceId: json['ResourceId'] as String,
      startsAt: json['StartsAt'] as String,
      endsAt: json['EndsAt'] as String,
      meta: json['Meta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CreateReservationRequestImplToJson(
        _$CreateReservationRequestImpl instance) =>
    <String, dynamic>{
      'ResourceType': instance.resourceType,
      'ResourceId': instance.resourceId,
      'StartsAt': instance.startsAt,
      'EndsAt': instance.endsAt,
      'Meta': instance.meta,
    };

_$UpdateReservationRequestImpl _$$UpdateReservationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateReservationRequestImpl(
      resourceType: json['ResourceType'] as String?,
      resourceId: json['ResourceId'] as String?,
      startsAt: json['StartsAt'] as String?,
      endsAt: json['EndsAt'] as String?,
      status: json['Status'] as String?,
      meta: json['Meta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$UpdateReservationRequestImplToJson(
        _$UpdateReservationRequestImpl instance) =>
    <String, dynamic>{
      'ResourceType': instance.resourceType,
      'ResourceId': instance.resourceId,
      'StartsAt': instance.startsAt,
      'EndsAt': instance.endsAt,
      'Status': instance.status,
      'Meta': instance.meta,
    };

_$LocationDtoImpl _$$LocationDtoImplFromJson(Map<String, dynamic> json) =>
    _$LocationDtoImpl(
      id: json['Id'] as String,
      name: json['Name'] as String,
      address: json['Address'] as String?,
    );

Map<String, dynamic> _$$LocationDtoImplToJson(_$LocationDtoImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Address': instance.address,
    };

_$DeskDtoImpl _$$DeskDtoImplFromJson(Map<String, dynamic> json) =>
    _$DeskDtoImpl(
      id: json['Id'] as String,
      name: json['Name'] as String,
      zoneId: json['ZoneId'] as String,
      features: (json['Features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$DeskDtoImplToJson(_$DeskDtoImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'ZoneId': instance.zoneId,
      'Features': instance.features,
    };

_$RoomDtoImpl _$$RoomDtoImplFromJson(Map<String, dynamic> json) =>
    _$RoomDtoImpl(
      id: json['Id'] as String,
      name: json['Name'] as String,
      locationId: json['LocationId'] as String,
      capacity: (json['Capacity'] as num).toInt(),
    );

Map<String, dynamic> _$$RoomDtoImplToJson(_$RoomDtoImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'LocationId': instance.locationId,
      'Capacity': instance.capacity,
    };
