// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) {
  return _AuthToken.fromJson(json);
}

/// @nodoc
mixin _$AuthToken {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;
  int get expiresIn => throw _privateConstructorUsedError;
  String? get scope => throw _privateConstructorUsedError;
  DateTime get issuedAt => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthTokenCopyWith<AuthToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokenCopyWith<$Res> {
  factory $AuthTokenCopyWith(AuthToken value, $Res Function(AuthToken) then) =
      _$AuthTokenCopyWithImpl<$Res, AuthToken>;
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      String tokenType,
      int expiresIn,
      String? scope,
      DateTime issuedAt,
      DateTime expiresAt});
}

/// @nodoc
class _$AuthTokenCopyWithImpl<$Res, $Val extends AuthToken>
    implements $AuthTokenCopyWith<$Res> {
  _$AuthTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? tokenType = null,
    Object? expiresIn = null,
    Object? scope = freezed,
    Object? issuedAt = null,
    Object? expiresAt = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedAt: null == issuedAt
          ? _value.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthTokenImplCopyWith<$Res>
    implements $AuthTokenCopyWith<$Res> {
  factory _$$AuthTokenImplCopyWith(
          _$AuthTokenImpl value, $Res Function(_$AuthTokenImpl) then) =
      __$$AuthTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      String tokenType,
      int expiresIn,
      String? scope,
      DateTime issuedAt,
      DateTime expiresAt});
}

/// @nodoc
class __$$AuthTokenImplCopyWithImpl<$Res>
    extends _$AuthTokenCopyWithImpl<$Res, _$AuthTokenImpl>
    implements _$$AuthTokenImplCopyWith<$Res> {
  __$$AuthTokenImplCopyWithImpl(
      _$AuthTokenImpl _value, $Res Function(_$AuthTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? tokenType = null,
    Object? expiresIn = null,
    Object? scope = freezed,
    Object? issuedAt = null,
    Object? expiresAt = null,
  }) {
    return _then(_$AuthTokenImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedAt: null == issuedAt
          ? _value.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthTokenImpl implements _AuthToken {
  const _$AuthTokenImpl(
      {required this.accessToken,
      required this.refreshToken,
      required this.tokenType,
      required this.expiresIn,
      this.scope,
      required this.issuedAt,
      required this.expiresAt});

  factory _$AuthTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthTokenImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final String tokenType;
  @override
  final int expiresIn;
  @override
  final String? scope;
  @override
  final DateTime issuedAt;
  @override
  final DateTime expiresAt;

  @override
  String toString() {
    return 'AuthToken(accessToken: $accessToken, refreshToken: $refreshToken, tokenType: $tokenType, expiresIn: $expiresIn, scope: $scope, issuedAt: $issuedAt, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthTokenImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.issuedAt, issuedAt) ||
                other.issuedAt == issuedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken,
      tokenType, expiresIn, scope, issuedAt, expiresAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthTokenImplCopyWith<_$AuthTokenImpl> get copyWith =>
      __$$AuthTokenImplCopyWithImpl<_$AuthTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthTokenImplToJson(
      this,
    );
  }
}

abstract class _AuthToken implements AuthToken {
  const factory _AuthToken(
      {required final String accessToken,
      required final String refreshToken,
      required final String tokenType,
      required final int expiresIn,
      final String? scope,
      required final DateTime issuedAt,
      required final DateTime expiresAt}) = _$AuthTokenImpl;

  factory _AuthToken.fromJson(Map<String, dynamic> json) =
      _$AuthTokenImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  String get tokenType;
  @override
  int get expiresIn;
  @override
  String? get scope;
  @override
  DateTime get issuedAt;
  @override
  DateTime get expiresAt;
  @override
  @JsonKey(ignore: true)
  _$$AuthTokenImplCopyWith<_$AuthTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QrToken _$QrTokenFromJson(Map<String, dynamic> json) {
  return _QrToken.fromJson(json);
}

/// @nodoc
mixin _$QrToken {
  String get token => throw _privateConstructorUsedError;
  String get reservationId => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  QrTokenType get type => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QrTokenCopyWith<QrToken> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrTokenCopyWith<$Res> {
  factory $QrTokenCopyWith(QrToken value, $Res Function(QrToken) then) =
      _$QrTokenCopyWithImpl<$Res, QrToken>;
  @useResult
  $Res call(
      {String token,
      String reservationId,
      DateTime expiresAt,
      QrTokenType type,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$QrTokenCopyWithImpl<$Res, $Val extends QrToken>
    implements $QrTokenCopyWith<$Res> {
  _$QrTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? reservationId = null,
    Object? expiresAt = null,
    Object? type = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      reservationId: null == reservationId
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QrTokenType,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QrTokenImplCopyWith<$Res> implements $QrTokenCopyWith<$Res> {
  factory _$$QrTokenImplCopyWith(
          _$QrTokenImpl value, $Res Function(_$QrTokenImpl) then) =
      __$$QrTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String token,
      String reservationId,
      DateTime expiresAt,
      QrTokenType type,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$QrTokenImplCopyWithImpl<$Res>
    extends _$QrTokenCopyWithImpl<$Res, _$QrTokenImpl>
    implements _$$QrTokenImplCopyWith<$Res> {
  __$$QrTokenImplCopyWithImpl(
      _$QrTokenImpl _value, $Res Function(_$QrTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? reservationId = null,
    Object? expiresAt = null,
    Object? type = null,
    Object? metadata = freezed,
  }) {
    return _then(_$QrTokenImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      reservationId: null == reservationId
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QrTokenType,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QrTokenImpl implements _QrToken {
  const _$QrTokenImpl(
      {required this.token,
      required this.reservationId,
      required this.expiresAt,
      required this.type,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$QrTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$QrTokenImplFromJson(json);

  @override
  final String token;
  @override
  final String reservationId;
  @override
  final DateTime expiresAt;
  @override
  final QrTokenType type;
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
    return 'QrToken(token: $token, reservationId: $reservationId, expiresAt: $expiresAt, type: $type, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrTokenImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.reservationId, reservationId) ||
                other.reservationId == reservationId) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, reservationId, expiresAt,
      type, const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QrTokenImplCopyWith<_$QrTokenImpl> get copyWith =>
      __$$QrTokenImplCopyWithImpl<_$QrTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QrTokenImplToJson(
      this,
    );
  }
}

abstract class _QrToken implements QrToken {
  const factory _QrToken(
      {required final String token,
      required final String reservationId,
      required final DateTime expiresAt,
      required final QrTokenType type,
      final Map<String, dynamic>? metadata}) = _$QrTokenImpl;

  factory _QrToken.fromJson(Map<String, dynamic> json) = _$QrTokenImpl.fromJson;

  @override
  String get token;
  @override
  String get reservationId;
  @override
  DateTime get expiresAt;
  @override
  QrTokenType get type;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$QrTokenImplCopyWith<_$QrTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckInRequest _$CheckInRequestFromJson(Map<String, dynamic> json) {
  return _CheckInRequest.fromJson(json);
}

/// @nodoc
mixin _$CheckInRequest {
  String get token => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckInRequestCopyWith<CheckInRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInRequestCopyWith<$Res> {
  factory $CheckInRequestCopyWith(
          CheckInRequest value, $Res Function(CheckInRequest) then) =
      _$CheckInRequestCopyWithImpl<$Res, CheckInRequest>;
  @useResult
  $Res call({String token, DateTime? timestamp, String? location});
}

/// @nodoc
class _$CheckInRequestCopyWithImpl<$Res, $Val extends CheckInRequest>
    implements $CheckInRequestCopyWith<$Res> {
  _$CheckInRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? timestamp = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckInRequestImplCopyWith<$Res>
    implements $CheckInRequestCopyWith<$Res> {
  factory _$$CheckInRequestImplCopyWith(_$CheckInRequestImpl value,
          $Res Function(_$CheckInRequestImpl) then) =
      __$$CheckInRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, DateTime? timestamp, String? location});
}

/// @nodoc
class __$$CheckInRequestImplCopyWithImpl<$Res>
    extends _$CheckInRequestCopyWithImpl<$Res, _$CheckInRequestImpl>
    implements _$$CheckInRequestImplCopyWith<$Res> {
  __$$CheckInRequestImplCopyWithImpl(
      _$CheckInRequestImpl _value, $Res Function(_$CheckInRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? timestamp = freezed,
    Object? location = freezed,
  }) {
    return _then(_$CheckInRequestImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckInRequestImpl implements _CheckInRequest {
  const _$CheckInRequestImpl(
      {required this.token, this.timestamp, this.location});

  factory _$CheckInRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInRequestImplFromJson(json);

  @override
  final String token;
  @override
  final DateTime? timestamp;
  @override
  final String? location;

  @override
  String toString() {
    return 'CheckInRequest(token: $token, timestamp: $timestamp, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInRequestImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, timestamp, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInRequestImplCopyWith<_$CheckInRequestImpl> get copyWith =>
      __$$CheckInRequestImplCopyWithImpl<_$CheckInRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInRequestImplToJson(
      this,
    );
  }
}

abstract class _CheckInRequest implements CheckInRequest {
  const factory _CheckInRequest(
      {required final String token,
      final DateTime? timestamp,
      final String? location}) = _$CheckInRequestImpl;

  factory _CheckInRequest.fromJson(Map<String, dynamic> json) =
      _$CheckInRequestImpl.fromJson;

  @override
  String get token;
  @override
  DateTime? get timestamp;
  @override
  String? get location;
  @override
  @JsonKey(ignore: true)
  _$$CheckInRequestImplCopyWith<_$CheckInRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckInResponse _$CheckInResponseFromJson(Map<String, dynamic> json) {
  return _CheckInResponse.fromJson(json);
}

/// @nodoc
mixin _$CheckInResponse {
  String get reservationId => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  DateTime? get checkedInAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckInResponseCopyWith<CheckInResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInResponseCopyWith<$Res> {
  factory $CheckInResponseCopyWith(
          CheckInResponse value, $Res Function(CheckInResponse) then) =
      _$CheckInResponseCopyWithImpl<$Res, CheckInResponse>;
  @useResult
  $Res call(
      {String reservationId,
      bool success,
      String? message,
      DateTime? checkedInAt});
}

/// @nodoc
class _$CheckInResponseCopyWithImpl<$Res, $Val extends CheckInResponse>
    implements $CheckInResponseCopyWith<$Res> {
  _$CheckInResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationId = null,
    Object? success = null,
    Object? message = freezed,
    Object? checkedInAt = freezed,
  }) {
    return _then(_value.copyWith(
      reservationId: null == reservationId
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedInAt: freezed == checkedInAt
          ? _value.checkedInAt
          : checkedInAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckInResponseImplCopyWith<$Res>
    implements $CheckInResponseCopyWith<$Res> {
  factory _$$CheckInResponseImplCopyWith(_$CheckInResponseImpl value,
          $Res Function(_$CheckInResponseImpl) then) =
      __$$CheckInResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reservationId,
      bool success,
      String? message,
      DateTime? checkedInAt});
}

/// @nodoc
class __$$CheckInResponseImplCopyWithImpl<$Res>
    extends _$CheckInResponseCopyWithImpl<$Res, _$CheckInResponseImpl>
    implements _$$CheckInResponseImplCopyWith<$Res> {
  __$$CheckInResponseImplCopyWithImpl(
      _$CheckInResponseImpl _value, $Res Function(_$CheckInResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationId = null,
    Object? success = null,
    Object? message = freezed,
    Object? checkedInAt = freezed,
  }) {
    return _then(_$CheckInResponseImpl(
      reservationId: null == reservationId
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      checkedInAt: freezed == checkedInAt
          ? _value.checkedInAt
          : checkedInAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckInResponseImpl implements _CheckInResponse {
  const _$CheckInResponseImpl(
      {required this.reservationId,
      required this.success,
      this.message,
      this.checkedInAt});

  factory _$CheckInResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInResponseImplFromJson(json);

  @override
  final String reservationId;
  @override
  final bool success;
  @override
  final String? message;
  @override
  final DateTime? checkedInAt;

  @override
  String toString() {
    return 'CheckInResponse(reservationId: $reservationId, success: $success, message: $message, checkedInAt: $checkedInAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInResponseImpl &&
            (identical(other.reservationId, reservationId) ||
                other.reservationId == reservationId) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.checkedInAt, checkedInAt) ||
                other.checkedInAt == checkedInAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, reservationId, success, message, checkedInAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInResponseImplCopyWith<_$CheckInResponseImpl> get copyWith =>
      __$$CheckInResponseImplCopyWithImpl<_$CheckInResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInResponseImplToJson(
      this,
    );
  }
}

abstract class _CheckInResponse implements CheckInResponse {
  const factory _CheckInResponse(
      {required final String reservationId,
      required final bool success,
      final String? message,
      final DateTime? checkedInAt}) = _$CheckInResponseImpl;

  factory _CheckInResponse.fromJson(Map<String, dynamic> json) =
      _$CheckInResponseImpl.fromJson;

  @override
  String get reservationId;
  @override
  bool get success;
  @override
  String? get message;
  @override
  DateTime? get checkedInAt;
  @override
  @JsonKey(ignore: true)
  _$$CheckInResponseImplCopyWith<_$CheckInResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
