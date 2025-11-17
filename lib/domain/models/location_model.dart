import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

/// Location DTO - Office locations için
@freezed
class LocationDto with _$LocationDto {
  const factory LocationDto({
    required String id,
    required String name,
    required String address,
    required String city,
    required String country,
    required String zipCode,
    String? description,
    double? latitude,
    double? longitude,
    bool? isActive,
    int? capacity,
    String? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _LocationDto;

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);
}

/// Create Location Request
@freezed
class CreateLocationRequest with _$CreateLocationRequest {
  const factory CreateLocationRequest({
    required String name,
    required String address,
    required String city,
    required String country,
    required String zipCode,
    String? description,
    double? latitude,
    double? longitude,
    int? capacity,
    String? imageUrl,
  }) = _CreateLocationRequest;

  factory CreateLocationRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateLocationRequestFromJson(json);
}

/// Update Location Request
@freezed
class UpdateLocationRequest with _$UpdateLocationRequest {
  const factory UpdateLocationRequest({
    String? name,
    String? address,
    String? city,
    String? country,
    String? zipCode,
    String? description,
    double? latitude,
    double? longitude,
    bool? isActive,
    int? capacity,
    String? imageUrl,
  }) = _UpdateLocationRequest;

  factory UpdateLocationRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateLocationRequestFromJson(json);
}

/// Floor DTO - Location içerisindeki katlar
@freezed
class FloorDto with _$FloorDto {
  const factory FloorDto({
    required String id,
    required String locationId,
    required String name,
    required int floorNumber,
    String? description,
    bool? isActive,
    int? capacity,
    DateTime? createdAt,
  }) = _FloorDto;

  factory FloorDto.fromJson(Map<String, dynamic> json) =>
      _$FloorDtoFromJson(json);
}

/// Zone DTO - Floor içerisindeki alanlar
@freezed
class ZoneDto with _$ZoneDto {
  const factory ZoneDto({
    required String id,
    required String floorId,
    required String name,
    String? description,
    bool? isActive,
    int? capacity,
    DateTime? createdAt,
  }) = _ZoneDto;

  factory ZoneDto.fromJson(Map<String, dynamic> json) =>
      _$ZoneDtoFromJson(json);
}

/// Desk DTO - Çalışma masaları
@freezed
class DeskDto with _$DeskDto {
  const factory DeskDto({
    required String id,
    required String zoneId,
    required String name,
    String? type,
    bool? isActive,
    bool? isAvailable,
    String? notes,
    DateTime? createdAt,
  }) = _DeskDto;

  factory DeskDto.fromJson(Map<String, dynamic> json) =>
      _$DeskDtoFromJson(json);
}

/// Room DTO - Toplantı odaları
@freezed
class RoomDto with _$RoomDto {
  const factory RoomDto({
    required String id,
    required String floorId,
    required String name,
    String? roomType,
    int? capacity,
    bool? isActive,
    bool? hasProjector,
    bool? hasWhiteboard,
    String? notes,
    DateTime? createdAt,
  }) = _RoomDto;

  factory RoomDto.fromJson(Map<String, dynamic> json) =>
      _$RoomDtoFromJson(json);
}
