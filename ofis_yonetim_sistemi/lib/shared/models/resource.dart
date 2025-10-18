import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource.freezed.dart';
part 'resource.g.dart';

@freezed
class Resource with _$Resource {
  const factory Resource({
    required String id,
    required String name,
    required ResourceType type,
    String? description,
    required String locationId,
    String? locationName,
    String? zoneId,
    String? zoneName,
    String? floorId,
    String? floorName,
    int? capacity,
    required List<String> amenities,
    required bool isActive,
    String? imageUrl,
    Map<String, dynamic>? metadata,
  }) = _Resource;

  factory Resource.fromJson(Map<String, dynamic> json) => _$ResourceFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    required String id,
    required String name,
    String? description,
    String? address,
    String? city,
    String? country,
    required bool isActive,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

@freezed
class Zone with _$Zone {
  const factory Zone({
    required String id,
    required String name,
    String? description,
    required String locationId,
    String? floorId,
    required bool isActive,
  }) = _Zone;

  factory Zone.fromJson(Map<String, dynamic> json) => _$ZoneFromJson(json);
}

enum ResourceType {
  @JsonValue('desk')
  desk,
  @JsonValue('room')
  room,
  @JsonValue('meeting_room')
  meetingRoom,
  @JsonValue('phone_booth')
  phoneBooth,
  @JsonValue('parking_space')
  parkingSpace,
}