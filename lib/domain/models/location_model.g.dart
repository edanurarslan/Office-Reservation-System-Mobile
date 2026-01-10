// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationDtoImpl _$$LocationDtoImplFromJson(Map<String, dynamic> json) =>
    _$LocationDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String? ?? '',
      city: json['city'] as String? ?? '',
      country: json['country'] as String? ?? '',
      zipCode: json['zipCode'] as String? ?? '',
      description: json['description'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      isActive: json['isActive'] as bool?,
      capacity: (json['capacity'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$LocationDtoImplToJson(_$LocationDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'zipCode': instance.zipCode,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'isActive': instance.isActive,
      'capacity': instance.capacity,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$CreateLocationRequestImpl _$$CreateLocationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateLocationRequestImpl(
      name: json['name'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      zipCode: json['zipCode'] as String,
      description: json['description'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      capacity: (json['capacity'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$CreateLocationRequestImplToJson(
        _$CreateLocationRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'zipCode': instance.zipCode,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'capacity': instance.capacity,
      'imageUrl': instance.imageUrl,
    };

_$UpdateLocationRequestImpl _$$UpdateLocationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateLocationRequestImpl(
      name: json['name'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      zipCode: json['zipCode'] as String?,
      description: json['description'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      isActive: json['isActive'] as bool?,
      capacity: (json['capacity'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$UpdateLocationRequestImplToJson(
        _$UpdateLocationRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'zipCode': instance.zipCode,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'isActive': instance.isActive,
      'capacity': instance.capacity,
      'imageUrl': instance.imageUrl,
    };

_$FloorDtoImpl _$$FloorDtoImplFromJson(Map<String, dynamic> json) =>
    _$FloorDtoImpl(
      id: json['id'] as String,
      locationId: json['locationId'] as String,
      name: json['name'] as String,
      floorNumber: (json['floorNumber'] as num).toInt(),
      description: json['description'] as String?,
      isActive: json['isActive'] as bool?,
      capacity: (json['capacity'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$FloorDtoImplToJson(_$FloorDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locationId': instance.locationId,
      'name': instance.name,
      'floorNumber': instance.floorNumber,
      'description': instance.description,
      'isActive': instance.isActive,
      'capacity': instance.capacity,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$ZoneDtoImpl _$$ZoneDtoImplFromJson(Map<String, dynamic> json) =>
    _$ZoneDtoImpl(
      id: json['id'] as String,
      floorId: json['floorId'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      isActive: json['isActive'] as bool?,
      capacity: (json['capacity'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ZoneDtoImplToJson(_$ZoneDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'floorId': instance.floorId,
      'name': instance.name,
      'description': instance.description,
      'isActive': instance.isActive,
      'capacity': instance.capacity,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$DeskDtoImpl _$$DeskDtoImplFromJson(Map<String, dynamic> json) =>
    _$DeskDtoImpl(
      id: json['id'] as String,
      zoneId: json['zoneId'] as String,
      name: json['name'] as String,
      type: json['type'] as String?,
      isActive: json['isActive'] as bool?,
      isAvailable: json['isAvailable'] as bool?,
      notes: json['notes'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$DeskDtoImplToJson(_$DeskDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'zoneId': instance.zoneId,
      'name': instance.name,
      'type': instance.type,
      'isActive': instance.isActive,
      'isAvailable': instance.isAvailable,
      'notes': instance.notes,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$RoomDtoImpl _$$RoomDtoImplFromJson(Map<String, dynamic> json) =>
    _$RoomDtoImpl(
      id: json['id'] as String,
      floorId: json['floorId'] as String,
      name: json['name'] as String,
      roomType: json['roomType'] as String?,
      capacity: (json['capacity'] as num?)?.toInt(),
      isActive: json['isActive'] as bool?,
      hasProjector: json['hasProjector'] as bool?,
      hasWhiteboard: json['hasWhiteboard'] as bool?,
      notes: json['notes'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$RoomDtoImplToJson(_$RoomDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'floorId': instance.floorId,
      'name': instance.name,
      'roomType': instance.roomType,
      'capacity': instance.capacity,
      'isActive': instance.isActive,
      'hasProjector': instance.hasProjector,
      'hasWhiteboard': instance.hasWhiteboard,
      'notes': instance.notes,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
