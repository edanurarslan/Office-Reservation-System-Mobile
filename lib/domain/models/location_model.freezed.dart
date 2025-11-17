// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) {
  return _LocationDto.fromJson(json);
}

/// @nodoc
mixin _$LocationDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get zipCode => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  int? get capacity => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationDtoCopyWith<LocationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDtoCopyWith<$Res> {
  factory $LocationDtoCopyWith(
          LocationDto value, $Res Function(LocationDto) then) =
      _$LocationDtoCopyWithImpl<$Res, LocationDto>;
  @useResult
  $Res call(
      {String id,
      String name,
      String address,
      String city,
      String country,
      String zipCode,
      String? description,
      double? latitude,
      double? longitude,
      bool? isActive,
      int? capacity,
      String? imageUrl,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$LocationDtoCopyWithImpl<$Res, $Val extends LocationDto>
    implements $LocationDtoCopyWith<$Res> {
  _$LocationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? city = null,
    Object? country = null,
    Object? zipCode = null,
    Object? description = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isActive = freezed,
    Object? capacity = freezed,
    Object? imageUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationDtoImplCopyWith<$Res>
    implements $LocationDtoCopyWith<$Res> {
  factory _$$LocationDtoImplCopyWith(
          _$LocationDtoImpl value, $Res Function(_$LocationDtoImpl) then) =
      __$$LocationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String address,
      String city,
      String country,
      String zipCode,
      String? description,
      double? latitude,
      double? longitude,
      bool? isActive,
      int? capacity,
      String? imageUrl,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$LocationDtoImplCopyWithImpl<$Res>
    extends _$LocationDtoCopyWithImpl<$Res, _$LocationDtoImpl>
    implements _$$LocationDtoImplCopyWith<$Res> {
  __$$LocationDtoImplCopyWithImpl(
      _$LocationDtoImpl _value, $Res Function(_$LocationDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? city = null,
    Object? country = null,
    Object? zipCode = null,
    Object? description = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isActive = freezed,
    Object? capacity = freezed,
    Object? imageUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$LocationDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationDtoImpl implements _LocationDto {
  const _$LocationDtoImpl(
      {required this.id,
      required this.name,
      required this.address,
      required this.city,
      required this.country,
      required this.zipCode,
      this.description,
      this.latitude,
      this.longitude,
      this.isActive,
      this.capacity,
      this.imageUrl,
      this.createdAt,
      this.updatedAt});

  factory _$LocationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;
  @override
  final String city;
  @override
  final String country;
  @override
  final String zipCode;
  @override
  final String? description;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final bool? isActive;
  @override
  final int? capacity;
  @override
  final String? imageUrl;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'LocationDto(id: $id, name: $name, address: $address, city: $city, country: $country, zipCode: $zipCode, description: $description, latitude: $latitude, longitude: $longitude, isActive: $isActive, capacity: $capacity, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      city,
      country,
      zipCode,
      description,
      latitude,
      longitude,
      isActive,
      capacity,
      imageUrl,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationDtoImplCopyWith<_$LocationDtoImpl> get copyWith =>
      __$$LocationDtoImplCopyWithImpl<_$LocationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationDtoImplToJson(
      this,
    );
  }
}

abstract class _LocationDto implements LocationDto {
  const factory _LocationDto(
      {required final String id,
      required final String name,
      required final String address,
      required final String city,
      required final String country,
      required final String zipCode,
      final String? description,
      final double? latitude,
      final double? longitude,
      final bool? isActive,
      final int? capacity,
      final String? imageUrl,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$LocationDtoImpl;

  factory _LocationDto.fromJson(Map<String, dynamic> json) =
      _$LocationDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;
  @override
  String get city;
  @override
  String get country;
  @override
  String get zipCode;
  @override
  String? get description;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  bool? get isActive;
  @override
  int? get capacity;
  @override
  String? get imageUrl;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$LocationDtoImplCopyWith<_$LocationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateLocationRequest _$CreateLocationRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateLocationRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateLocationRequest {
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get zipCode => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  int? get capacity => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateLocationRequestCopyWith<CreateLocationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateLocationRequestCopyWith<$Res> {
  factory $CreateLocationRequestCopyWith(CreateLocationRequest value,
          $Res Function(CreateLocationRequest) then) =
      _$CreateLocationRequestCopyWithImpl<$Res, CreateLocationRequest>;
  @useResult
  $Res call(
      {String name,
      String address,
      String city,
      String country,
      String zipCode,
      String? description,
      double? latitude,
      double? longitude,
      int? capacity,
      String? imageUrl});
}

/// @nodoc
class _$CreateLocationRequestCopyWithImpl<$Res,
        $Val extends CreateLocationRequest>
    implements $CreateLocationRequestCopyWith<$Res> {
  _$CreateLocationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? city = null,
    Object? country = null,
    Object? zipCode = null,
    Object? description = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? capacity = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateLocationRequestImplCopyWith<$Res>
    implements $CreateLocationRequestCopyWith<$Res> {
  factory _$$CreateLocationRequestImplCopyWith(
          _$CreateLocationRequestImpl value,
          $Res Function(_$CreateLocationRequestImpl) then) =
      __$$CreateLocationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String address,
      String city,
      String country,
      String zipCode,
      String? description,
      double? latitude,
      double? longitude,
      int? capacity,
      String? imageUrl});
}

/// @nodoc
class __$$CreateLocationRequestImplCopyWithImpl<$Res>
    extends _$CreateLocationRequestCopyWithImpl<$Res,
        _$CreateLocationRequestImpl>
    implements _$$CreateLocationRequestImplCopyWith<$Res> {
  __$$CreateLocationRequestImplCopyWithImpl(_$CreateLocationRequestImpl _value,
      $Res Function(_$CreateLocationRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? city = null,
    Object? country = null,
    Object? zipCode = null,
    Object? description = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? capacity = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$CreateLocationRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateLocationRequestImpl implements _CreateLocationRequest {
  const _$CreateLocationRequestImpl(
      {required this.name,
      required this.address,
      required this.city,
      required this.country,
      required this.zipCode,
      this.description,
      this.latitude,
      this.longitude,
      this.capacity,
      this.imageUrl});

  factory _$CreateLocationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateLocationRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String address;
  @override
  final String city;
  @override
  final String country;
  @override
  final String zipCode;
  @override
  final String? description;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final int? capacity;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'CreateLocationRequest(name: $name, address: $address, city: $city, country: $country, zipCode: $zipCode, description: $description, latitude: $latitude, longitude: $longitude, capacity: $capacity, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateLocationRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, address, city, country,
      zipCode, description, latitude, longitude, capacity, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateLocationRequestImplCopyWith<_$CreateLocationRequestImpl>
      get copyWith => __$$CreateLocationRequestImplCopyWithImpl<
          _$CreateLocationRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateLocationRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateLocationRequest implements CreateLocationRequest {
  const factory _CreateLocationRequest(
      {required final String name,
      required final String address,
      required final String city,
      required final String country,
      required final String zipCode,
      final String? description,
      final double? latitude,
      final double? longitude,
      final int? capacity,
      final String? imageUrl}) = _$CreateLocationRequestImpl;

  factory _CreateLocationRequest.fromJson(Map<String, dynamic> json) =
      _$CreateLocationRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get address;
  @override
  String get city;
  @override
  String get country;
  @override
  String get zipCode;
  @override
  String? get description;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  int? get capacity;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$CreateLocationRequestImplCopyWith<_$CreateLocationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateLocationRequest _$UpdateLocationRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateLocationRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateLocationRequest {
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get zipCode => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  int? get capacity => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateLocationRequestCopyWith<UpdateLocationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateLocationRequestCopyWith<$Res> {
  factory $UpdateLocationRequestCopyWith(UpdateLocationRequest value,
          $Res Function(UpdateLocationRequest) then) =
      _$UpdateLocationRequestCopyWithImpl<$Res, UpdateLocationRequest>;
  @useResult
  $Res call(
      {String? name,
      String? address,
      String? city,
      String? country,
      String? zipCode,
      String? description,
      double? latitude,
      double? longitude,
      bool? isActive,
      int? capacity,
      String? imageUrl});
}

/// @nodoc
class _$UpdateLocationRequestCopyWithImpl<$Res,
        $Val extends UpdateLocationRequest>
    implements $UpdateLocationRequestCopyWith<$Res> {
  _$UpdateLocationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? zipCode = freezed,
    Object? description = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isActive = freezed,
    Object? capacity = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateLocationRequestImplCopyWith<$Res>
    implements $UpdateLocationRequestCopyWith<$Res> {
  factory _$$UpdateLocationRequestImplCopyWith(
          _$UpdateLocationRequestImpl value,
          $Res Function(_$UpdateLocationRequestImpl) then) =
      __$$UpdateLocationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? address,
      String? city,
      String? country,
      String? zipCode,
      String? description,
      double? latitude,
      double? longitude,
      bool? isActive,
      int? capacity,
      String? imageUrl});
}

/// @nodoc
class __$$UpdateLocationRequestImplCopyWithImpl<$Res>
    extends _$UpdateLocationRequestCopyWithImpl<$Res,
        _$UpdateLocationRequestImpl>
    implements _$$UpdateLocationRequestImplCopyWith<$Res> {
  __$$UpdateLocationRequestImplCopyWithImpl(_$UpdateLocationRequestImpl _value,
      $Res Function(_$UpdateLocationRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? zipCode = freezed,
    Object? description = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isActive = freezed,
    Object? capacity = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$UpdateLocationRequestImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateLocationRequestImpl implements _UpdateLocationRequest {
  const _$UpdateLocationRequestImpl(
      {this.name,
      this.address,
      this.city,
      this.country,
      this.zipCode,
      this.description,
      this.latitude,
      this.longitude,
      this.isActive,
      this.capacity,
      this.imageUrl});

  factory _$UpdateLocationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateLocationRequestImplFromJson(json);

  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? country;
  @override
  final String? zipCode;
  @override
  final String? description;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final bool? isActive;
  @override
  final int? capacity;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'UpdateLocationRequest(name: $name, address: $address, city: $city, country: $country, zipCode: $zipCode, description: $description, latitude: $latitude, longitude: $longitude, isActive: $isActive, capacity: $capacity, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateLocationRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, address, city, country,
      zipCode, description, latitude, longitude, isActive, capacity, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateLocationRequestImplCopyWith<_$UpdateLocationRequestImpl>
      get copyWith => __$$UpdateLocationRequestImplCopyWithImpl<
          _$UpdateLocationRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateLocationRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateLocationRequest implements UpdateLocationRequest {
  const factory _UpdateLocationRequest(
      {final String? name,
      final String? address,
      final String? city,
      final String? country,
      final String? zipCode,
      final String? description,
      final double? latitude,
      final double? longitude,
      final bool? isActive,
      final int? capacity,
      final String? imageUrl}) = _$UpdateLocationRequestImpl;

  factory _UpdateLocationRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateLocationRequestImpl.fromJson;

  @override
  String? get name;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get country;
  @override
  String? get zipCode;
  @override
  String? get description;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  bool? get isActive;
  @override
  int? get capacity;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$UpdateLocationRequestImplCopyWith<_$UpdateLocationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FloorDto _$FloorDtoFromJson(Map<String, dynamic> json) {
  return _FloorDto.fromJson(json);
}

/// @nodoc
mixin _$FloorDto {
  String get id => throw _privateConstructorUsedError;
  String get locationId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get floorNumber => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  int? get capacity => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FloorDtoCopyWith<FloorDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorDtoCopyWith<$Res> {
  factory $FloorDtoCopyWith(FloorDto value, $Res Function(FloorDto) then) =
      _$FloorDtoCopyWithImpl<$Res, FloorDto>;
  @useResult
  $Res call(
      {String id,
      String locationId,
      String name,
      int floorNumber,
      String? description,
      bool? isActive,
      int? capacity,
      DateTime? createdAt});
}

/// @nodoc
class _$FloorDtoCopyWithImpl<$Res, $Val extends FloorDto>
    implements $FloorDtoCopyWith<$Res> {
  _$FloorDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? locationId = null,
    Object? name = null,
    Object? floorNumber = null,
    Object? description = freezed,
    Object? isActive = freezed,
    Object? capacity = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      floorNumber: null == floorNumber
          ? _value.floorNumber
          : floorNumber // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FloorDtoImplCopyWith<$Res>
    implements $FloorDtoCopyWith<$Res> {
  factory _$$FloorDtoImplCopyWith(
          _$FloorDtoImpl value, $Res Function(_$FloorDtoImpl) then) =
      __$$FloorDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String locationId,
      String name,
      int floorNumber,
      String? description,
      bool? isActive,
      int? capacity,
      DateTime? createdAt});
}

/// @nodoc
class __$$FloorDtoImplCopyWithImpl<$Res>
    extends _$FloorDtoCopyWithImpl<$Res, _$FloorDtoImpl>
    implements _$$FloorDtoImplCopyWith<$Res> {
  __$$FloorDtoImplCopyWithImpl(
      _$FloorDtoImpl _value, $Res Function(_$FloorDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? locationId = null,
    Object? name = null,
    Object? floorNumber = null,
    Object? description = freezed,
    Object? isActive = freezed,
    Object? capacity = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$FloorDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      floorNumber: null == floorNumber
          ? _value.floorNumber
          : floorNumber // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FloorDtoImpl implements _FloorDto {
  const _$FloorDtoImpl(
      {required this.id,
      required this.locationId,
      required this.name,
      required this.floorNumber,
      this.description,
      this.isActive,
      this.capacity,
      this.createdAt});

  factory _$FloorDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FloorDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String locationId;
  @override
  final String name;
  @override
  final int floorNumber;
  @override
  final String? description;
  @override
  final bool? isActive;
  @override
  final int? capacity;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'FloorDto(id: $id, locationId: $locationId, name: $name, floorNumber: $floorNumber, description: $description, isActive: $isActive, capacity: $capacity, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloorDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.floorNumber, floorNumber) ||
                other.floorNumber == floorNumber) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, locationId, name,
      floorNumber, description, isActive, capacity, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FloorDtoImplCopyWith<_$FloorDtoImpl> get copyWith =>
      __$$FloorDtoImplCopyWithImpl<_$FloorDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FloorDtoImplToJson(
      this,
    );
  }
}

abstract class _FloorDto implements FloorDto {
  const factory _FloorDto(
      {required final String id,
      required final String locationId,
      required final String name,
      required final int floorNumber,
      final String? description,
      final bool? isActive,
      final int? capacity,
      final DateTime? createdAt}) = _$FloorDtoImpl;

  factory _FloorDto.fromJson(Map<String, dynamic> json) =
      _$FloorDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get locationId;
  @override
  String get name;
  @override
  int get floorNumber;
  @override
  String? get description;
  @override
  bool? get isActive;
  @override
  int? get capacity;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$FloorDtoImplCopyWith<_$FloorDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ZoneDto _$ZoneDtoFromJson(Map<String, dynamic> json) {
  return _ZoneDto.fromJson(json);
}

/// @nodoc
mixin _$ZoneDto {
  String get id => throw _privateConstructorUsedError;
  String get floorId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  int? get capacity => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZoneDtoCopyWith<ZoneDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZoneDtoCopyWith<$Res> {
  factory $ZoneDtoCopyWith(ZoneDto value, $Res Function(ZoneDto) then) =
      _$ZoneDtoCopyWithImpl<$Res, ZoneDto>;
  @useResult
  $Res call(
      {String id,
      String floorId,
      String name,
      String? description,
      bool? isActive,
      int? capacity,
      DateTime? createdAt});
}

/// @nodoc
class _$ZoneDtoCopyWithImpl<$Res, $Val extends ZoneDto>
    implements $ZoneDtoCopyWith<$Res> {
  _$ZoneDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? floorId = null,
    Object? name = null,
    Object? description = freezed,
    Object? isActive = freezed,
    Object? capacity = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      floorId: null == floorId
          ? _value.floorId
          : floorId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ZoneDtoImplCopyWith<$Res> implements $ZoneDtoCopyWith<$Res> {
  factory _$$ZoneDtoImplCopyWith(
          _$ZoneDtoImpl value, $Res Function(_$ZoneDtoImpl) then) =
      __$$ZoneDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String floorId,
      String name,
      String? description,
      bool? isActive,
      int? capacity,
      DateTime? createdAt});
}

/// @nodoc
class __$$ZoneDtoImplCopyWithImpl<$Res>
    extends _$ZoneDtoCopyWithImpl<$Res, _$ZoneDtoImpl>
    implements _$$ZoneDtoImplCopyWith<$Res> {
  __$$ZoneDtoImplCopyWithImpl(
      _$ZoneDtoImpl _value, $Res Function(_$ZoneDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? floorId = null,
    Object? name = null,
    Object? description = freezed,
    Object? isActive = freezed,
    Object? capacity = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$ZoneDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      floorId: null == floorId
          ? _value.floorId
          : floorId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ZoneDtoImpl implements _ZoneDto {
  const _$ZoneDtoImpl(
      {required this.id,
      required this.floorId,
      required this.name,
      this.description,
      this.isActive,
      this.capacity,
      this.createdAt});

  factory _$ZoneDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ZoneDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String floorId;
  @override
  final String name;
  @override
  final String? description;
  @override
  final bool? isActive;
  @override
  final int? capacity;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ZoneDto(id: $id, floorId: $floorId, name: $name, description: $description, isActive: $isActive, capacity: $capacity, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZoneDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.floorId, floorId) || other.floorId == floorId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, floorId, name, description,
      isActive, capacity, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZoneDtoImplCopyWith<_$ZoneDtoImpl> get copyWith =>
      __$$ZoneDtoImplCopyWithImpl<_$ZoneDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ZoneDtoImplToJson(
      this,
    );
  }
}

abstract class _ZoneDto implements ZoneDto {
  const factory _ZoneDto(
      {required final String id,
      required final String floorId,
      required final String name,
      final String? description,
      final bool? isActive,
      final int? capacity,
      final DateTime? createdAt}) = _$ZoneDtoImpl;

  factory _ZoneDto.fromJson(Map<String, dynamic> json) = _$ZoneDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get floorId;
  @override
  String get name;
  @override
  String? get description;
  @override
  bool? get isActive;
  @override
  int? get capacity;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ZoneDtoImplCopyWith<_$ZoneDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeskDto _$DeskDtoFromJson(Map<String, dynamic> json) {
  return _DeskDto.fromJson(json);
}

/// @nodoc
mixin _$DeskDto {
  String get id => throw _privateConstructorUsedError;
  String get zoneId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  bool? get isAvailable => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeskDtoCopyWith<DeskDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeskDtoCopyWith<$Res> {
  factory $DeskDtoCopyWith(DeskDto value, $Res Function(DeskDto) then) =
      _$DeskDtoCopyWithImpl<$Res, DeskDto>;
  @useResult
  $Res call(
      {String id,
      String zoneId,
      String name,
      String? type,
      bool? isActive,
      bool? isAvailable,
      String? notes,
      DateTime? createdAt});
}

/// @nodoc
class _$DeskDtoCopyWithImpl<$Res, $Val extends DeskDto>
    implements $DeskDtoCopyWith<$Res> {
  _$DeskDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? zoneId = null,
    Object? name = null,
    Object? type = freezed,
    Object? isActive = freezed,
    Object? isAvailable = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      zoneId: null == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeskDtoImplCopyWith<$Res> implements $DeskDtoCopyWith<$Res> {
  factory _$$DeskDtoImplCopyWith(
          _$DeskDtoImpl value, $Res Function(_$DeskDtoImpl) then) =
      __$$DeskDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String zoneId,
      String name,
      String? type,
      bool? isActive,
      bool? isAvailable,
      String? notes,
      DateTime? createdAt});
}

/// @nodoc
class __$$DeskDtoImplCopyWithImpl<$Res>
    extends _$DeskDtoCopyWithImpl<$Res, _$DeskDtoImpl>
    implements _$$DeskDtoImplCopyWith<$Res> {
  __$$DeskDtoImplCopyWithImpl(
      _$DeskDtoImpl _value, $Res Function(_$DeskDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? zoneId = null,
    Object? name = null,
    Object? type = freezed,
    Object? isActive = freezed,
    Object? isAvailable = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$DeskDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      zoneId: null == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeskDtoImpl implements _DeskDto {
  const _$DeskDtoImpl(
      {required this.id,
      required this.zoneId,
      required this.name,
      this.type,
      this.isActive,
      this.isAvailable,
      this.notes,
      this.createdAt});

  factory _$DeskDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeskDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String zoneId;
  @override
  final String name;
  @override
  final String? type;
  @override
  final bool? isActive;
  @override
  final bool? isAvailable;
  @override
  final String? notes;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'DeskDto(id: $id, zoneId: $zoneId, name: $name, type: $type, isActive: $isActive, isAvailable: $isAvailable, notes: $notes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeskDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, zoneId, name, type, isActive,
      isAvailable, notes, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeskDtoImplCopyWith<_$DeskDtoImpl> get copyWith =>
      __$$DeskDtoImplCopyWithImpl<_$DeskDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeskDtoImplToJson(
      this,
    );
  }
}

abstract class _DeskDto implements DeskDto {
  const factory _DeskDto(
      {required final String id,
      required final String zoneId,
      required final String name,
      final String? type,
      final bool? isActive,
      final bool? isAvailable,
      final String? notes,
      final DateTime? createdAt}) = _$DeskDtoImpl;

  factory _DeskDto.fromJson(Map<String, dynamic> json) = _$DeskDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get zoneId;
  @override
  String get name;
  @override
  String? get type;
  @override
  bool? get isActive;
  @override
  bool? get isAvailable;
  @override
  String? get notes;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$DeskDtoImplCopyWith<_$DeskDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RoomDto _$RoomDtoFromJson(Map<String, dynamic> json) {
  return _RoomDto.fromJson(json);
}

/// @nodoc
mixin _$RoomDto {
  String get id => throw _privateConstructorUsedError;
  String get floorId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get roomType => throw _privateConstructorUsedError;
  int? get capacity => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  bool? get hasProjector => throw _privateConstructorUsedError;
  bool? get hasWhiteboard => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomDtoCopyWith<RoomDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomDtoCopyWith<$Res> {
  factory $RoomDtoCopyWith(RoomDto value, $Res Function(RoomDto) then) =
      _$RoomDtoCopyWithImpl<$Res, RoomDto>;
  @useResult
  $Res call(
      {String id,
      String floorId,
      String name,
      String? roomType,
      int? capacity,
      bool? isActive,
      bool? hasProjector,
      bool? hasWhiteboard,
      String? notes,
      DateTime? createdAt});
}

/// @nodoc
class _$RoomDtoCopyWithImpl<$Res, $Val extends RoomDto>
    implements $RoomDtoCopyWith<$Res> {
  _$RoomDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? floorId = null,
    Object? name = null,
    Object? roomType = freezed,
    Object? capacity = freezed,
    Object? isActive = freezed,
    Object? hasProjector = freezed,
    Object? hasWhiteboard = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      floorId: null == floorId
          ? _value.floorId
          : floorId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      roomType: freezed == roomType
          ? _value.roomType
          : roomType // ignore: cast_nullable_to_non_nullable
              as String?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasProjector: freezed == hasProjector
          ? _value.hasProjector
          : hasProjector // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasWhiteboard: freezed == hasWhiteboard
          ? _value.hasWhiteboard
          : hasWhiteboard // ignore: cast_nullable_to_non_nullable
              as bool?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomDtoImplCopyWith<$Res> implements $RoomDtoCopyWith<$Res> {
  factory _$$RoomDtoImplCopyWith(
          _$RoomDtoImpl value, $Res Function(_$RoomDtoImpl) then) =
      __$$RoomDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String floorId,
      String name,
      String? roomType,
      int? capacity,
      bool? isActive,
      bool? hasProjector,
      bool? hasWhiteboard,
      String? notes,
      DateTime? createdAt});
}

/// @nodoc
class __$$RoomDtoImplCopyWithImpl<$Res>
    extends _$RoomDtoCopyWithImpl<$Res, _$RoomDtoImpl>
    implements _$$RoomDtoImplCopyWith<$Res> {
  __$$RoomDtoImplCopyWithImpl(
      _$RoomDtoImpl _value, $Res Function(_$RoomDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? floorId = null,
    Object? name = null,
    Object? roomType = freezed,
    Object? capacity = freezed,
    Object? isActive = freezed,
    Object? hasProjector = freezed,
    Object? hasWhiteboard = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$RoomDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      floorId: null == floorId
          ? _value.floorId
          : floorId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      roomType: freezed == roomType
          ? _value.roomType
          : roomType // ignore: cast_nullable_to_non_nullable
              as String?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasProjector: freezed == hasProjector
          ? _value.hasProjector
          : hasProjector // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasWhiteboard: freezed == hasWhiteboard
          ? _value.hasWhiteboard
          : hasWhiteboard // ignore: cast_nullable_to_non_nullable
              as bool?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomDtoImpl implements _RoomDto {
  const _$RoomDtoImpl(
      {required this.id,
      required this.floorId,
      required this.name,
      this.roomType,
      this.capacity,
      this.isActive,
      this.hasProjector,
      this.hasWhiteboard,
      this.notes,
      this.createdAt});

  factory _$RoomDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String floorId;
  @override
  final String name;
  @override
  final String? roomType;
  @override
  final int? capacity;
  @override
  final bool? isActive;
  @override
  final bool? hasProjector;
  @override
  final bool? hasWhiteboard;
  @override
  final String? notes;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'RoomDto(id: $id, floorId: $floorId, name: $name, roomType: $roomType, capacity: $capacity, isActive: $isActive, hasProjector: $hasProjector, hasWhiteboard: $hasWhiteboard, notes: $notes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.floorId, floorId) || other.floorId == floorId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.roomType, roomType) ||
                other.roomType == roomType) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.hasProjector, hasProjector) ||
                other.hasProjector == hasProjector) &&
            (identical(other.hasWhiteboard, hasWhiteboard) ||
                other.hasWhiteboard == hasWhiteboard) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, floorId, name, roomType,
      capacity, isActive, hasProjector, hasWhiteboard, notes, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomDtoImplCopyWith<_$RoomDtoImpl> get copyWith =>
      __$$RoomDtoImplCopyWithImpl<_$RoomDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomDtoImplToJson(
      this,
    );
  }
}

abstract class _RoomDto implements RoomDto {
  const factory _RoomDto(
      {required final String id,
      required final String floorId,
      required final String name,
      final String? roomType,
      final int? capacity,
      final bool? isActive,
      final bool? hasProjector,
      final bool? hasWhiteboard,
      final String? notes,
      final DateTime? createdAt}) = _$RoomDtoImpl;

  factory _RoomDto.fromJson(Map<String, dynamic> json) = _$RoomDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get floorId;
  @override
  String get name;
  @override
  String? get roomType;
  @override
  int? get capacity;
  @override
  bool? get isActive;
  @override
  bool? get hasProjector;
  @override
  bool? get hasWhiteboard;
  @override
  String? get notes;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$RoomDtoImplCopyWith<_$RoomDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
