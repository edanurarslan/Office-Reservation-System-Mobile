// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReservationDto _$ReservationDtoFromJson(Map<String, dynamic> json) {
  return _ReservationDto.fromJson(json);
}

/// @nodoc
mixin _$ReservationDto {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  ResourceType get resourceType => throw _privateConstructorUsedError;
  String get resourceId => throw _privateConstructorUsedError;
  DateTime get startsAt => throw _privateConstructorUsedError;
  DateTime get endsAt => throw _privateConstructorUsedError;
  ReservationStatus get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get purpose => throw _privateConstructorUsedError;
  int? get expectedAttendees => throw _privateConstructorUsedError;
  DateTime? get checkInAt => throw _privateConstructorUsedError;
  DateTime? get checkOutAt => throw _privateConstructorUsedError;
  String? get cancellationReason => throw _privateConstructorUsedError;
  DateTime? get cancelledAt => throw _privateConstructorUsedError;
  bool? get isRecurring => throw _privateConstructorUsedError;
  String? get recurrencePattern => throw _privateConstructorUsedError;
  String? get parentReservationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReservationDtoCopyWith<ReservationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationDtoCopyWith<$Res> {
  factory $ReservationDtoCopyWith(
          ReservationDto value, $Res Function(ReservationDto) then) =
      _$ReservationDtoCopyWithImpl<$Res, ReservationDto>;
  @useResult
  $Res call(
      {String id,
      String userId,
      ResourceType resourceType,
      String resourceId,
      DateTime startsAt,
      DateTime endsAt,
      ReservationStatus status,
      String? notes,
      String? purpose,
      int? expectedAttendees,
      DateTime? checkInAt,
      DateTime? checkOutAt,
      String? cancellationReason,
      DateTime? cancelledAt,
      bool? isRecurring,
      String? recurrencePattern,
      String? parentReservationId});
}

/// @nodoc
class _$ReservationDtoCopyWithImpl<$Res, $Val extends ReservationDto>
    implements $ReservationDtoCopyWith<$Res> {
  _$ReservationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? resourceType = null,
    Object? resourceId = null,
    Object? startsAt = null,
    Object? endsAt = null,
    Object? status = null,
    Object? notes = freezed,
    Object? purpose = freezed,
    Object? expectedAttendees = freezed,
    Object? checkInAt = freezed,
    Object? checkOutAt = freezed,
    Object? cancellationReason = freezed,
    Object? cancelledAt = freezed,
    Object? isRecurring = freezed,
    Object? recurrencePattern = freezed,
    Object? parentReservationId = freezed,
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
      resourceType: null == resourceType
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as ResourceType,
      resourceId: null == resourceId
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as String,
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
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedAttendees: freezed == expectedAttendees
          ? _value.expectedAttendees
          : expectedAttendees // ignore: cast_nullable_to_non_nullable
              as int?,
      checkInAt: freezed == checkInAt
          ? _value.checkInAt
          : checkInAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOutAt: freezed == checkOutAt
          ? _value.checkOutAt
          : checkOutAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRecurring: freezed == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool?,
      recurrencePattern: freezed == recurrencePattern
          ? _value.recurrencePattern
          : recurrencePattern // ignore: cast_nullable_to_non_nullable
              as String?,
      parentReservationId: freezed == parentReservationId
          ? _value.parentReservationId
          : parentReservationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReservationDtoImplCopyWith<$Res>
    implements $ReservationDtoCopyWith<$Res> {
  factory _$$ReservationDtoImplCopyWith(_$ReservationDtoImpl value,
          $Res Function(_$ReservationDtoImpl) then) =
      __$$ReservationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      ResourceType resourceType,
      String resourceId,
      DateTime startsAt,
      DateTime endsAt,
      ReservationStatus status,
      String? notes,
      String? purpose,
      int? expectedAttendees,
      DateTime? checkInAt,
      DateTime? checkOutAt,
      String? cancellationReason,
      DateTime? cancelledAt,
      bool? isRecurring,
      String? recurrencePattern,
      String? parentReservationId});
}

/// @nodoc
class __$$ReservationDtoImplCopyWithImpl<$Res>
    extends _$ReservationDtoCopyWithImpl<$Res, _$ReservationDtoImpl>
    implements _$$ReservationDtoImplCopyWith<$Res> {
  __$$ReservationDtoImplCopyWithImpl(
      _$ReservationDtoImpl _value, $Res Function(_$ReservationDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? resourceType = null,
    Object? resourceId = null,
    Object? startsAt = null,
    Object? endsAt = null,
    Object? status = null,
    Object? notes = freezed,
    Object? purpose = freezed,
    Object? expectedAttendees = freezed,
    Object? checkInAt = freezed,
    Object? checkOutAt = freezed,
    Object? cancellationReason = freezed,
    Object? cancelledAt = freezed,
    Object? isRecurring = freezed,
    Object? recurrencePattern = freezed,
    Object? parentReservationId = freezed,
  }) {
    return _then(_$ReservationDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      resourceType: null == resourceType
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as ResourceType,
      resourceId: null == resourceId
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as String,
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
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedAttendees: freezed == expectedAttendees
          ? _value.expectedAttendees
          : expectedAttendees // ignore: cast_nullable_to_non_nullable
              as int?,
      checkInAt: freezed == checkInAt
          ? _value.checkInAt
          : checkInAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkOutAt: freezed == checkOutAt
          ? _value.checkOutAt
          : checkOutAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isRecurring: freezed == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool?,
      recurrencePattern: freezed == recurrencePattern
          ? _value.recurrencePattern
          : recurrencePattern // ignore: cast_nullable_to_non_nullable
              as String?,
      parentReservationId: freezed == parentReservationId
          ? _value.parentReservationId
          : parentReservationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationDtoImpl implements _ReservationDto {
  const _$ReservationDtoImpl(
      {required this.id,
      required this.userId,
      required this.resourceType,
      required this.resourceId,
      required this.startsAt,
      required this.endsAt,
      required this.status,
      this.notes,
      this.purpose,
      this.expectedAttendees,
      this.checkInAt,
      this.checkOutAt,
      this.cancellationReason,
      this.cancelledAt,
      this.isRecurring,
      this.recurrencePattern,
      this.parentReservationId});

  factory _$ReservationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReservationDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final ResourceType resourceType;
  @override
  final String resourceId;
  @override
  final DateTime startsAt;
  @override
  final DateTime endsAt;
  @override
  final ReservationStatus status;
  @override
  final String? notes;
  @override
  final String? purpose;
  @override
  final int? expectedAttendees;
  @override
  final DateTime? checkInAt;
  @override
  final DateTime? checkOutAt;
  @override
  final String? cancellationReason;
  @override
  final DateTime? cancelledAt;
  @override
  final bool? isRecurring;
  @override
  final String? recurrencePattern;
  @override
  final String? parentReservationId;

  @override
  String toString() {
    return 'ReservationDto(id: $id, userId: $userId, resourceType: $resourceType, resourceId: $resourceId, startsAt: $startsAt, endsAt: $endsAt, status: $status, notes: $notes, purpose: $purpose, expectedAttendees: $expectedAttendees, checkInAt: $checkInAt, checkOutAt: $checkOutAt, cancellationReason: $cancellationReason, cancelledAt: $cancelledAt, isRecurring: $isRecurring, recurrencePattern: $recurrencePattern, parentReservationId: $parentReservationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.resourceType, resourceType) ||
                other.resourceType == resourceType) &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.expectedAttendees, expectedAttendees) ||
                other.expectedAttendees == expectedAttendees) &&
            (identical(other.checkInAt, checkInAt) ||
                other.checkInAt == checkInAt) &&
            (identical(other.checkOutAt, checkOutAt) ||
                other.checkOutAt == checkOutAt) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.recurrencePattern, recurrencePattern) ||
                other.recurrencePattern == recurrencePattern) &&
            (identical(other.parentReservationId, parentReservationId) ||
                other.parentReservationId == parentReservationId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      resourceType,
      resourceId,
      startsAt,
      endsAt,
      status,
      notes,
      purpose,
      expectedAttendees,
      checkInAt,
      checkOutAt,
      cancellationReason,
      cancelledAt,
      isRecurring,
      recurrencePattern,
      parentReservationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationDtoImplCopyWith<_$ReservationDtoImpl> get copyWith =>
      __$$ReservationDtoImplCopyWithImpl<_$ReservationDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationDtoImplToJson(
      this,
    );
  }
}

abstract class _ReservationDto implements ReservationDto {
  const factory _ReservationDto(
      {required final String id,
      required final String userId,
      required final ResourceType resourceType,
      required final String resourceId,
      required final DateTime startsAt,
      required final DateTime endsAt,
      required final ReservationStatus status,
      final String? notes,
      final String? purpose,
      final int? expectedAttendees,
      final DateTime? checkInAt,
      final DateTime? checkOutAt,
      final String? cancellationReason,
      final DateTime? cancelledAt,
      final bool? isRecurring,
      final String? recurrencePattern,
      final String? parentReservationId}) = _$ReservationDtoImpl;

  factory _ReservationDto.fromJson(Map<String, dynamic> json) =
      _$ReservationDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  ResourceType get resourceType;
  @override
  String get resourceId;
  @override
  DateTime get startsAt;
  @override
  DateTime get endsAt;
  @override
  ReservationStatus get status;
  @override
  String? get notes;
  @override
  String? get purpose;
  @override
  int? get expectedAttendees;
  @override
  DateTime? get checkInAt;
  @override
  DateTime? get checkOutAt;
  @override
  String? get cancellationReason;
  @override
  DateTime? get cancelledAt;
  @override
  bool? get isRecurring;
  @override
  String? get recurrencePattern;
  @override
  String? get parentReservationId;
  @override
  @JsonKey(ignore: true)
  _$$ReservationDtoImplCopyWith<_$ReservationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateReservationRequest _$CreateReservationRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateReservationRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateReservationRequest {
  String get resourceType => throw _privateConstructorUsedError;
  String get resourceId => throw _privateConstructorUsedError;
  String get startsAt => throw _privateConstructorUsedError;
  String get endsAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get purpose => throw _privateConstructorUsedError;
  int? get expectedAttendees => throw _privateConstructorUsedError;
  Map<String, dynamic>? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateReservationRequestCopyWith<CreateReservationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReservationRequestCopyWith<$Res> {
  factory $CreateReservationRequestCopyWith(CreateReservationRequest value,
          $Res Function(CreateReservationRequest) then) =
      _$CreateReservationRequestCopyWithImpl<$Res, CreateReservationRequest>;
  @useResult
  $Res call(
      {String resourceType,
      String resourceId,
      String startsAt,
      String endsAt,
      String? notes,
      String? purpose,
      int? expectedAttendees,
      Map<String, dynamic>? meta});
}

/// @nodoc
class _$CreateReservationRequestCopyWithImpl<$Res,
        $Val extends CreateReservationRequest>
    implements $CreateReservationRequestCopyWith<$Res> {
  _$CreateReservationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resourceType = null,
    Object? resourceId = null,
    Object? startsAt = null,
    Object? endsAt = null,
    Object? notes = freezed,
    Object? purpose = freezed,
    Object? expectedAttendees = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      resourceType: null == resourceType
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String,
      resourceId: null == resourceId
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as String,
      startsAt: null == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as String,
      endsAt: null == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedAttendees: freezed == expectedAttendees
          ? _value.expectedAttendees
          : expectedAttendees // ignore: cast_nullable_to_non_nullable
              as int?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateReservationRequestImplCopyWith<$Res>
    implements $CreateReservationRequestCopyWith<$Res> {
  factory _$$CreateReservationRequestImplCopyWith(
          _$CreateReservationRequestImpl value,
          $Res Function(_$CreateReservationRequestImpl) then) =
      __$$CreateReservationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String resourceType,
      String resourceId,
      String startsAt,
      String endsAt,
      String? notes,
      String? purpose,
      int? expectedAttendees,
      Map<String, dynamic>? meta});
}

/// @nodoc
class __$$CreateReservationRequestImplCopyWithImpl<$Res>
    extends _$CreateReservationRequestCopyWithImpl<$Res,
        _$CreateReservationRequestImpl>
    implements _$$CreateReservationRequestImplCopyWith<$Res> {
  __$$CreateReservationRequestImplCopyWithImpl(
      _$CreateReservationRequestImpl _value,
      $Res Function(_$CreateReservationRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resourceType = null,
    Object? resourceId = null,
    Object? startsAt = null,
    Object? endsAt = null,
    Object? notes = freezed,
    Object? purpose = freezed,
    Object? expectedAttendees = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$CreateReservationRequestImpl(
      resourceType: null == resourceType
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String,
      resourceId: null == resourceId
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as String,
      startsAt: null == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as String,
      endsAt: null == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedAttendees: freezed == expectedAttendees
          ? _value.expectedAttendees
          : expectedAttendees // ignore: cast_nullable_to_non_nullable
              as int?,
      meta: freezed == meta
          ? _value._meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateReservationRequestImpl implements _CreateReservationRequest {
  const _$CreateReservationRequestImpl(
      {required this.resourceType,
      required this.resourceId,
      required this.startsAt,
      required this.endsAt,
      this.notes,
      this.purpose,
      this.expectedAttendees,
      final Map<String, dynamic>? meta})
      : _meta = meta;

  factory _$CreateReservationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateReservationRequestImplFromJson(json);

  @override
  final String resourceType;
  @override
  final String resourceId;
  @override
  final String startsAt;
  @override
  final String endsAt;
  @override
  final String? notes;
  @override
  final String? purpose;
  @override
  final int? expectedAttendees;
  final Map<String, dynamic>? _meta;
  @override
  Map<String, dynamic>? get meta {
    final value = _meta;
    if (value == null) return null;
    if (_meta is EqualUnmodifiableMapView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CreateReservationRequest(resourceType: $resourceType, resourceId: $resourceId, startsAt: $startsAt, endsAt: $endsAt, notes: $notes, purpose: $purpose, expectedAttendees: $expectedAttendees, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReservationRequestImpl &&
            (identical(other.resourceType, resourceType) ||
                other.resourceType == resourceType) &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.expectedAttendees, expectedAttendees) ||
                other.expectedAttendees == expectedAttendees) &&
            const DeepCollectionEquality().equals(other._meta, _meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      resourceType,
      resourceId,
      startsAt,
      endsAt,
      notes,
      purpose,
      expectedAttendees,
      const DeepCollectionEquality().hash(_meta));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReservationRequestImplCopyWith<_$CreateReservationRequestImpl>
      get copyWith => __$$CreateReservationRequestImplCopyWithImpl<
          _$CreateReservationRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateReservationRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateReservationRequest implements CreateReservationRequest {
  const factory _CreateReservationRequest(
      {required final String resourceType,
      required final String resourceId,
      required final String startsAt,
      required final String endsAt,
      final String? notes,
      final String? purpose,
      final int? expectedAttendees,
      final Map<String, dynamic>? meta}) = _$CreateReservationRequestImpl;

  factory _CreateReservationRequest.fromJson(Map<String, dynamic> json) =
      _$CreateReservationRequestImpl.fromJson;

  @override
  String get resourceType;
  @override
  String get resourceId;
  @override
  String get startsAt;
  @override
  String get endsAt;
  @override
  String? get notes;
  @override
  String? get purpose;
  @override
  int? get expectedAttendees;
  @override
  Map<String, dynamic>? get meta;
  @override
  @JsonKey(ignore: true)
  _$$CreateReservationRequestImplCopyWith<_$CreateReservationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateReservationRequest _$UpdateReservationRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateReservationRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateReservationRequest {
  String? get resourceType => throw _privateConstructorUsedError;
  String? get resourceId => throw _privateConstructorUsedError;
  String? get startsAt => throw _privateConstructorUsedError;
  String? get endsAt => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get purpose => throw _privateConstructorUsedError;
  int? get expectedAttendees => throw _privateConstructorUsedError;
  Map<String, dynamic>? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateReservationRequestCopyWith<UpdateReservationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateReservationRequestCopyWith<$Res> {
  factory $UpdateReservationRequestCopyWith(UpdateReservationRequest value,
          $Res Function(UpdateReservationRequest) then) =
      _$UpdateReservationRequestCopyWithImpl<$Res, UpdateReservationRequest>;
  @useResult
  $Res call(
      {String? resourceType,
      String? resourceId,
      String? startsAt,
      String? endsAt,
      String? status,
      String? notes,
      String? purpose,
      int? expectedAttendees,
      Map<String, dynamic>? meta});
}

/// @nodoc
class _$UpdateReservationRequestCopyWithImpl<$Res,
        $Val extends UpdateReservationRequest>
    implements $UpdateReservationRequestCopyWith<$Res> {
  _$UpdateReservationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resourceType = freezed,
    Object? resourceId = freezed,
    Object? startsAt = freezed,
    Object? endsAt = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? purpose = freezed,
    Object? expectedAttendees = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      resourceType: freezed == resourceType
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String?,
      resourceId: freezed == resourceId
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      startsAt: freezed == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as String?,
      endsAt: freezed == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedAttendees: freezed == expectedAttendees
          ? _value.expectedAttendees
          : expectedAttendees // ignore: cast_nullable_to_non_nullable
              as int?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateReservationRequestImplCopyWith<$Res>
    implements $UpdateReservationRequestCopyWith<$Res> {
  factory _$$UpdateReservationRequestImplCopyWith(
          _$UpdateReservationRequestImpl value,
          $Res Function(_$UpdateReservationRequestImpl) then) =
      __$$UpdateReservationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? resourceType,
      String? resourceId,
      String? startsAt,
      String? endsAt,
      String? status,
      String? notes,
      String? purpose,
      int? expectedAttendees,
      Map<String, dynamic>? meta});
}

/// @nodoc
class __$$UpdateReservationRequestImplCopyWithImpl<$Res>
    extends _$UpdateReservationRequestCopyWithImpl<$Res,
        _$UpdateReservationRequestImpl>
    implements _$$UpdateReservationRequestImplCopyWith<$Res> {
  __$$UpdateReservationRequestImplCopyWithImpl(
      _$UpdateReservationRequestImpl _value,
      $Res Function(_$UpdateReservationRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resourceType = freezed,
    Object? resourceId = freezed,
    Object? startsAt = freezed,
    Object? endsAt = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? purpose = freezed,
    Object? expectedAttendees = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$UpdateReservationRequestImpl(
      resourceType: freezed == resourceType
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String?,
      resourceId: freezed == resourceId
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as String?,
      startsAt: freezed == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as String?,
      endsAt: freezed == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedAttendees: freezed == expectedAttendees
          ? _value.expectedAttendees
          : expectedAttendees // ignore: cast_nullable_to_non_nullable
              as int?,
      meta: freezed == meta
          ? _value._meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateReservationRequestImpl implements _UpdateReservationRequest {
  const _$UpdateReservationRequestImpl(
      {this.resourceType,
      this.resourceId,
      this.startsAt,
      this.endsAt,
      this.status,
      this.notes,
      this.purpose,
      this.expectedAttendees,
      final Map<String, dynamic>? meta})
      : _meta = meta;

  factory _$UpdateReservationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateReservationRequestImplFromJson(json);

  @override
  final String? resourceType;
  @override
  final String? resourceId;
  @override
  final String? startsAt;
  @override
  final String? endsAt;
  @override
  final String? status;
  @override
  final String? notes;
  @override
  final String? purpose;
  @override
  final int? expectedAttendees;
  final Map<String, dynamic>? _meta;
  @override
  Map<String, dynamic>? get meta {
    final value = _meta;
    if (value == null) return null;
    if (_meta is EqualUnmodifiableMapView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'UpdateReservationRequest(resourceType: $resourceType, resourceId: $resourceId, startsAt: $startsAt, endsAt: $endsAt, status: $status, notes: $notes, purpose: $purpose, expectedAttendees: $expectedAttendees, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateReservationRequestImpl &&
            (identical(other.resourceType, resourceType) ||
                other.resourceType == resourceType) &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.expectedAttendees, expectedAttendees) ||
                other.expectedAttendees == expectedAttendees) &&
            const DeepCollectionEquality().equals(other._meta, _meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      resourceType,
      resourceId,
      startsAt,
      endsAt,
      status,
      notes,
      purpose,
      expectedAttendees,
      const DeepCollectionEquality().hash(_meta));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateReservationRequestImplCopyWith<_$UpdateReservationRequestImpl>
      get copyWith => __$$UpdateReservationRequestImplCopyWithImpl<
          _$UpdateReservationRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateReservationRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateReservationRequest implements UpdateReservationRequest {
  const factory _UpdateReservationRequest(
      {final String? resourceType,
      final String? resourceId,
      final String? startsAt,
      final String? endsAt,
      final String? status,
      final String? notes,
      final String? purpose,
      final int? expectedAttendees,
      final Map<String, dynamic>? meta}) = _$UpdateReservationRequestImpl;

  factory _UpdateReservationRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateReservationRequestImpl.fromJson;

  @override
  String? get resourceType;
  @override
  String? get resourceId;
  @override
  String? get startsAt;
  @override
  String? get endsAt;
  @override
  String? get status;
  @override
  String? get notes;
  @override
  String? get purpose;
  @override
  int? get expectedAttendees;
  @override
  Map<String, dynamic>? get meta;
  @override
  @JsonKey(ignore: true)
  _$$UpdateReservationRequestImplCopyWith<_$UpdateReservationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
