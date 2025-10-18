// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Reservation _$ReservationFromJson(Map<String, dynamic> json) {
  return _Reservation.fromJson(json);
}

/// @nodoc
mixin _$Reservation {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get resourceId => throw _privateConstructorUsedError;
  String get resourceName => throw _privateConstructorUsedError;
  ResourceType get resourceType => throw _privateConstructorUsedError;
  DateTime get startsAt => throw _privateConstructorUsedError;
  DateTime get endsAt => throw _privateConstructorUsedError;
  ReservationStatus get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime? get checkedInAt => throw _privateConstructorUsedError;
  DateTime? get checkedOutAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get qrToken => throw _privateConstructorUsedError;
  DateTime? get qrTokenExpiresAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReservationCopyWith<Reservation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationCopyWith<$Res> {
  factory $ReservationCopyWith(
          Reservation value, $Res Function(Reservation) then) =
      _$ReservationCopyWithImpl<$Res, Reservation>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String resourceId,
      String resourceName,
      ResourceType resourceType,
      DateTime startsAt,
      DateTime endsAt,
      ReservationStatus status,
      String? notes,
      DateTime? checkedInAt,
      DateTime? checkedOutAt,
      DateTime createdAt,
      DateTime? updatedAt,
      String? qrToken,
      DateTime? qrTokenExpiresAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$ReservationCopyWithImpl<$Res, $Val extends Reservation>
    implements $ReservationCopyWith<$Res> {
  _$ReservationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? resourceId = null,
    Object? resourceName = null,
    Object? resourceType = null,
    Object? startsAt = null,
    Object? endsAt = null,
    Object? status = null,
    Object? notes = freezed,
    Object? checkedInAt = freezed,
    Object? checkedOutAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? qrToken = freezed,
    Object? qrTokenExpiresAt = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      resourceId: null == resourceId
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as String,
      resourceName: null == resourceName
          ? _value.resourceName
          : resourceName // ignore: cast_nullable_to_non_nullable
              as String,
      resourceType: null == resourceType
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as ResourceType,
      startsAt: null == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: null == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReservationStatus,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedInAt: freezed == checkedInAt
          ? _value.checkedInAt
          : checkedInAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkedOutAt: freezed == checkedOutAt
          ? _value.checkedOutAt
          : checkedOutAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      qrToken: freezed == qrToken
          ? _value.qrToken
          : qrToken // ignore: cast_nullable_to_non_nullable
              as String?,
      qrTokenExpiresAt: freezed == qrTokenExpiresAt
          ? _value.qrTokenExpiresAt
          : qrTokenExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReservationImplCopyWith<$Res>
    implements $ReservationCopyWith<$Res> {
  factory _$$ReservationImplCopyWith(
          _$ReservationImpl value, $Res Function(_$ReservationImpl) then) =
      __$$ReservationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String resourceId,
      String resourceName,
      ResourceType resourceType,
      DateTime startsAt,
      DateTime endsAt,
      ReservationStatus status,
      String? notes,
      DateTime? checkedInAt,
      DateTime? checkedOutAt,
      DateTime createdAt,
      DateTime? updatedAt,
      String? qrToken,
      DateTime? qrTokenExpiresAt,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$ReservationImplCopyWithImpl<$Res>
    extends _$ReservationCopyWithImpl<$Res, _$ReservationImpl>
    implements _$$ReservationImplCopyWith<$Res> {
  __$$ReservationImplCopyWithImpl(
      _$ReservationImpl _value, $Res Function(_$ReservationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? resourceId = null,
    Object? resourceName = null,
    Object? resourceType = null,
    Object? startsAt = null,
    Object? endsAt = null,
    Object? status = null,
    Object? notes = freezed,
    Object? checkedInAt = freezed,
    Object? checkedOutAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? qrToken = freezed,
    Object? qrTokenExpiresAt = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$ReservationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      resourceId: null == resourceId
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as String,
      resourceName: null == resourceName
          ? _value.resourceName
          : resourceName // ignore: cast_nullable_to_non_nullable
              as String,
      resourceType: null == resourceType
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as ResourceType,
      startsAt: null == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: null == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReservationStatus,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedInAt: freezed == checkedInAt
          ? _value.checkedInAt
          : checkedInAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkedOutAt: freezed == checkedOutAt
          ? _value.checkedOutAt
          : checkedOutAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      qrToken: freezed == qrToken
          ? _value.qrToken
          : qrToken // ignore: cast_nullable_to_non_nullable
              as String?,
      qrTokenExpiresAt: freezed == qrTokenExpiresAt
          ? _value.qrTokenExpiresAt
          : qrTokenExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationImpl implements _Reservation {
  const _$ReservationImpl(
      {required this.id,
      required this.userId,
      required this.resourceId,
      required this.resourceName,
      required this.resourceType,
      required this.startsAt,
      required this.endsAt,
      required this.status,
      this.notes,
      this.checkedInAt,
      this.checkedOutAt,
      required this.createdAt,
      this.updatedAt,
      this.qrToken,
      this.qrTokenExpiresAt,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$ReservationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReservationImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String resourceId;
  @override
  final String resourceName;
  @override
  final ResourceType resourceType;
  @override
  final DateTime startsAt;
  @override
  final DateTime endsAt;
  @override
  final ReservationStatus status;
  @override
  final String? notes;
  @override
  final DateTime? checkedInAt;
  @override
  final DateTime? checkedOutAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? qrToken;
  @override
  final DateTime? qrTokenExpiresAt;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Reservation(id: $id, userId: $userId, resourceId: $resourceId, resourceName: $resourceName, resourceType: $resourceType, startsAt: $startsAt, endsAt: $endsAt, status: $status, notes: $notes, checkedInAt: $checkedInAt, checkedOutAt: $checkedOutAt, createdAt: $createdAt, updatedAt: $updatedAt, qrToken: $qrToken, qrTokenExpiresAt: $qrTokenExpiresAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId) &&
            (identical(other.resourceName, resourceName) ||
                other.resourceName == resourceName) &&
            (identical(other.resourceType, resourceType) ||
                other.resourceType == resourceType) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.checkedInAt, checkedInAt) ||
                other.checkedInAt == checkedInAt) &&
            (identical(other.checkedOutAt, checkedOutAt) ||
                other.checkedOutAt == checkedOutAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.qrToken, qrToken) || other.qrToken == qrToken) &&
            (identical(other.qrTokenExpiresAt, qrTokenExpiresAt) ||
                other.qrTokenExpiresAt == qrTokenExpiresAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      resourceId,
      resourceName,
      resourceType,
      startsAt,
      endsAt,
      status,
      notes,
      checkedInAt,
      checkedOutAt,
      createdAt,
      updatedAt,
      qrToken,
      qrTokenExpiresAt,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationImplCopyWith<_$ReservationImpl> get copyWith =>
      __$$ReservationImplCopyWithImpl<_$ReservationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationImplToJson(
      this,
    );
  }
}

abstract class _Reservation implements Reservation {
  const factory _Reservation(
      {required final String id,
      required final String userId,
      required final String resourceId,
      required final String resourceName,
      required final ResourceType resourceType,
      required final DateTime startsAt,
      required final DateTime endsAt,
      required final ReservationStatus status,
      final String? notes,
      final DateTime? checkedInAt,
      final DateTime? checkedOutAt,
      required final DateTime createdAt,
      final DateTime? updatedAt,
      final String? qrToken,
      final DateTime? qrTokenExpiresAt,
      final Map<String, dynamic>? metadata}) = _$ReservationImpl;

  factory _Reservation.fromJson(Map<String, dynamic> json) =
      _$ReservationImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get resourceId;
  @override
  String get resourceName;
  @override
  ResourceType get resourceType;
  @override
  DateTime get startsAt;
  @override
  DateTime get endsAt;
  @override
  ReservationStatus get status;
  @override
  String? get notes;
  @override
  DateTime? get checkedInAt;
  @override
  DateTime? get checkedOutAt;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  String? get qrToken;
  @override
  DateTime? get qrTokenExpiresAt;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$ReservationImplCopyWith<_$ReservationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReservationRequest _$ReservationRequestFromJson(Map<String, dynamic> json) {
  return _ReservationRequest.fromJson(json);
}

/// @nodoc
mixin _$ReservationRequest {
  String get resourceId => throw _privateConstructorUsedError;
  ResourceType get resourceType => throw _privateConstructorUsedError;
  DateTime get startsAt => throw _privateConstructorUsedError;
  DateTime get endsAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReservationRequestCopyWith<ReservationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationRequestCopyWith<$Res> {
  factory $ReservationRequestCopyWith(
          ReservationRequest value, $Res Function(ReservationRequest) then) =
      _$ReservationRequestCopyWithImpl<$Res, ReservationRequest>;
  @useResult
  $Res call(
      {String resourceId,
      ResourceType resourceType,
      DateTime startsAt,
      DateTime endsAt,
      String? notes});
}

/// @nodoc
class _$ReservationRequestCopyWithImpl<$Res, $Val extends ReservationRequest>
    implements $ReservationRequestCopyWith<$Res> {
  _$ReservationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resourceId = null,
    Object? resourceType = null,
    Object? startsAt = null,
    Object? endsAt = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      resourceId: null == resourceId
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as String,
      resourceType: null == resourceType
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as ResourceType,
      startsAt: null == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: null == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReservationRequestImplCopyWith<$Res>
    implements $ReservationRequestCopyWith<$Res> {
  factory _$$ReservationRequestImplCopyWith(_$ReservationRequestImpl value,
          $Res Function(_$ReservationRequestImpl) then) =
      __$$ReservationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String resourceId,
      ResourceType resourceType,
      DateTime startsAt,
      DateTime endsAt,
      String? notes});
}

/// @nodoc
class __$$ReservationRequestImplCopyWithImpl<$Res>
    extends _$ReservationRequestCopyWithImpl<$Res, _$ReservationRequestImpl>
    implements _$$ReservationRequestImplCopyWith<$Res> {
  __$$ReservationRequestImplCopyWithImpl(_$ReservationRequestImpl _value,
      $Res Function(_$ReservationRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resourceId = null,
    Object? resourceType = null,
    Object? startsAt = null,
    Object? endsAt = null,
    Object? notes = freezed,
  }) {
    return _then(_$ReservationRequestImpl(
      resourceId: null == resourceId
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as String,
      resourceType: null == resourceType
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as ResourceType,
      startsAt: null == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endsAt: null == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationRequestImpl implements _ReservationRequest {
  const _$ReservationRequestImpl(
      {required this.resourceId,
      required this.resourceType,
      required this.startsAt,
      required this.endsAt,
      this.notes});

  factory _$ReservationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReservationRequestImplFromJson(json);

  @override
  final String resourceId;
  @override
  final ResourceType resourceType;
  @override
  final DateTime startsAt;
  @override
  final DateTime endsAt;
  @override
  final String? notes;

  @override
  String toString() {
    return 'ReservationRequest(resourceId: $resourceId, resourceType: $resourceType, startsAt: $startsAt, endsAt: $endsAt, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationRequestImpl &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId) &&
            (identical(other.resourceType, resourceType) ||
                other.resourceType == resourceType) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, resourceId, resourceType, startsAt, endsAt, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationRequestImplCopyWith<_$ReservationRequestImpl> get copyWith =>
      __$$ReservationRequestImplCopyWithImpl<_$ReservationRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationRequestImplToJson(
      this,
    );
  }
}

abstract class _ReservationRequest implements ReservationRequest {
  const factory _ReservationRequest(
      {required final String resourceId,
      required final ResourceType resourceType,
      required final DateTime startsAt,
      required final DateTime endsAt,
      final String? notes}) = _$ReservationRequestImpl;

  factory _ReservationRequest.fromJson(Map<String, dynamic> json) =
      _$ReservationRequestImpl.fromJson;

  @override
  String get resourceId;
  @override
  ResourceType get resourceType;
  @override
  DateTime get startsAt;
  @override
  DateTime get endsAt;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$ReservationRequestImplCopyWith<_$ReservationRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
