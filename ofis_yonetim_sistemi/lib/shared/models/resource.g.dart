// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResourceImpl _$$ResourceImplFromJson(Map<String, dynamic> json) =>
    _$ResourceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$ResourceTypeEnumMap, json['type']),
      description: json['description'] as String?,
      locationId: json['locationId'] as String,
      locationName: json['locationName'] as String?,
      zoneId: json['zoneId'] as String?,
      zoneName: json['zoneName'] as String?,
      floorId: json['floorId'] as String?,
      floorName: json['floorName'] as String?,
      capacity: (json['capacity'] as num?)?.toInt(),
      amenities:
          (json['amenities'] as List<dynamic>).map((e) => e as String).toList(),
      isActive: json['isActive'] as bool,
      imageUrl: json['imageUrl'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ResourceImplToJson(_$ResourceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$ResourceTypeEnumMap[instance.type]!,
      'description': instance.description,
      'locationId': instance.locationId,
      'locationName': instance.locationName,
      'zoneId': instance.zoneId,
      'zoneName': instance.zoneName,
      'floorId': instance.floorId,
      'floorName': instance.floorName,
      'capacity': instance.capacity,
      'amenities': instance.amenities,
      'isActive': instance.isActive,
      'imageUrl': instance.imageUrl,
      'metadata': instance.metadata,
    };

const _$ResourceTypeEnumMap = {
  ResourceType.desk: 'desk',
  ResourceType.room: 'room',
  ResourceType.meetingRoom: 'meeting_room',
  ResourceType.phoneBooth: 'phone_booth',
  ResourceType.parkingSpace: 'parking_space',
};

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'isActive': instance.isActive,
    };

_$ZoneImpl _$$ZoneImplFromJson(Map<String, dynamic> json) => _$ZoneImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      locationId: json['locationId'] as String,
      floorId: json['floorId'] as String?,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$ZoneImplToJson(_$ZoneImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'locationId': instance.locationId,
      'floorId': instance.floorId,
      'isActive': instance.isActive,
    };
