// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiResponse<T> _$ApiResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ApiResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ApiResponse<T> {
  bool get success => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  ApiError? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseCopyWith<T, ApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<T> value, $Res Function(ApiResponse<T>) then) =
      _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
  @useResult
  $Res call({bool success, T? data, String? message, ApiError? error});

  $ApiErrorCopyWith<$Res>? get error;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? message = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiError?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiErrorCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $ApiErrorCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApiResponseImplCopyWith<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  factory _$$ApiResponseImplCopyWith(_$ApiResponseImpl<T> value,
          $Res Function(_$ApiResponseImpl<T>) then) =
      __$$ApiResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({bool success, T? data, String? message, ApiError? error});

  @override
  $ApiErrorCopyWith<$Res>? get error;
}

/// @nodoc
class __$$ApiResponseImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ApiResponseImpl<T>>
    implements _$$ApiResponseImplCopyWith<T, $Res> {
  __$$ApiResponseImplCopyWithImpl(
      _$ApiResponseImpl<T> _value, $Res Function(_$ApiResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? message = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ApiResponseImpl<T>(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiError?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ApiResponseImpl<T> implements _ApiResponse<T> {
  const _$ApiResponseImpl(
      {required this.success, this.data, this.message, this.error});

  factory _$ApiResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ApiResponseImplFromJson(json, fromJsonT);

  @override
  final bool success;
  @override
  final T? data;
  @override
  final String? message;
  @override
  final ApiError? error;

  @override
  String toString() {
    return 'ApiResponse<$T>(success: $success, data: $data, message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseImpl<T> &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(data), message, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      __$$ApiResponseImplCopyWithImpl<T, _$ApiResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ApiResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _ApiResponse<T> implements ApiResponse<T> {
  const factory _ApiResponse(
      {required final bool success,
      final T? data,
      final String? message,
      final ApiError? error}) = _$ApiResponseImpl<T>;

  factory _ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ApiResponseImpl<T>.fromJson;

  @override
  bool get success;
  @override
  T? get data;
  @override
  String? get message;
  @override
  ApiError? get error;
  @override
  @JsonKey(ignore: true)
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) {
  return _ApiError.fromJson(json);
}

/// @nodoc
mixin _$ApiError {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Map<String, dynamic>? get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiErrorCopyWith<ApiError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiErrorCopyWith<$Res> {
  factory $ApiErrorCopyWith(ApiError value, $Res Function(ApiError) then) =
      _$ApiErrorCopyWithImpl<$Res, ApiError>;
  @useResult
  $Res call({String code, String message, Map<String, dynamic>? details});
}

/// @nodoc
class _$ApiErrorCopyWithImpl<$Res, $Val extends ApiError>
    implements $ApiErrorCopyWith<$Res> {
  _$ApiErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiErrorImplCopyWith<$Res>
    implements $ApiErrorCopyWith<$Res> {
  factory _$$ApiErrorImplCopyWith(
          _$ApiErrorImpl value, $Res Function(_$ApiErrorImpl) then) =
      __$$ApiErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message, Map<String, dynamic>? details});
}

/// @nodoc
class __$$ApiErrorImplCopyWithImpl<$Res>
    extends _$ApiErrorCopyWithImpl<$Res, _$ApiErrorImpl>
    implements _$$ApiErrorImplCopyWith<$Res> {
  __$$ApiErrorImplCopyWithImpl(
      _$ApiErrorImpl _value, $Res Function(_$ApiErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? details = freezed,
  }) {
    return _then(_$ApiErrorImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiErrorImpl implements _ApiError {
  const _$ApiErrorImpl(
      {required this.code,
      required this.message,
      final Map<String, dynamic>? details})
      : _details = details;

  factory _$ApiErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiErrorImplFromJson(json);

  @override
  final String code;
  @override
  final String message;
  final Map<String, dynamic>? _details;
  @override
  Map<String, dynamic>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ApiError(code: $code, message: $message, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiErrorImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, message,
      const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiErrorImplCopyWith<_$ApiErrorImpl> get copyWith =>
      __$$ApiErrorImplCopyWithImpl<_$ApiErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiErrorImplToJson(
      this,
    );
  }
}

abstract class _ApiError implements ApiError {
  const factory _ApiError(
      {required final String code,
      required final String message,
      final Map<String, dynamic>? details}) = _$ApiErrorImpl;

  factory _ApiError.fromJson(Map<String, dynamic> json) =
      _$ApiErrorImpl.fromJson;

  @override
  String get code;
  @override
  String get message;
  @override
  Map<String, dynamic>? get details;
  @override
  @JsonKey(ignore: true)
  _$$ApiErrorImplCopyWith<_$ApiErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return _LoginRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginRequest {
  @JsonKey(name: 'Email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'Password')
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginRequestCopyWith<LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestCopyWith<$Res> {
  factory $LoginRequestCopyWith(
          LoginRequest value, $Res Function(LoginRequest) then) =
      _$LoginRequestCopyWithImpl<$Res, LoginRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Email') String email,
      @JsonKey(name: 'Password') String password});
}

/// @nodoc
class _$LoginRequestCopyWithImpl<$Res, $Val extends LoginRequest>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginRequestImplCopyWith<$Res>
    implements $LoginRequestCopyWith<$Res> {
  factory _$$LoginRequestImplCopyWith(
          _$LoginRequestImpl value, $Res Function(_$LoginRequestImpl) then) =
      __$$LoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Email') String email,
      @JsonKey(name: 'Password') String password});
}

/// @nodoc
class __$$LoginRequestImplCopyWithImpl<$Res>
    extends _$LoginRequestCopyWithImpl<$Res, _$LoginRequestImpl>
    implements _$$LoginRequestImplCopyWith<$Res> {
  __$$LoginRequestImplCopyWithImpl(
      _$LoginRequestImpl _value, $Res Function(_$LoginRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$LoginRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginRequestImpl implements _LoginRequest {
  const _$LoginRequestImpl(
      {@JsonKey(name: 'Email') required this.email,
      @JsonKey(name: 'Password') required this.password});

  factory _$LoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestImplFromJson(json);

  @override
  @JsonKey(name: 'Email')
  final String email;
  @override
  @JsonKey(name: 'Password')
  final String password;

  @override
  String toString() {
    return 'LoginRequest(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      __$$LoginRequestImplCopyWithImpl<_$LoginRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestImplToJson(
      this,
    );
  }
}

abstract class _LoginRequest implements LoginRequest {
  const factory _LoginRequest(
          {@JsonKey(name: 'Email') required final String email,
          @JsonKey(name: 'Password') required final String password}) =
      _$LoginRequestImpl;

  factory _LoginRequest.fromJson(Map<String, dynamic> json) =
      _$LoginRequestImpl.fromJson;

  @override
  @JsonKey(name: 'Email')
  String get email;
  @override
  @JsonKey(name: 'Password')
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  @JsonKey(name: 'AccessToken')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'RefreshToken')
  String get refreshToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpiresIn')
  int get expiresIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'TokenType')
  String get tokenType => throw _privateConstructorUsedError;
  @JsonKey(name: 'User')
  UserDto get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'AccessToken') String accessToken,
      @JsonKey(name: 'RefreshToken') String refreshToken,
      @JsonKey(name: 'ExpiresIn') int expiresIn,
      @JsonKey(name: 'TokenType') String tokenType,
      @JsonKey(name: 'User') UserDto user});

  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
    Object? tokenType = null,
    Object? user = null,
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
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get user {
    return $UserDtoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'AccessToken') String accessToken,
      @JsonKey(name: 'RefreshToken') String refreshToken,
      @JsonKey(name: 'ExpiresIn') int expiresIn,
      @JsonKey(name: 'TokenType') String tokenType,
      @JsonKey(name: 'User') UserDto user});

  @override
  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
    Object? tokenType = null,
    Object? user = null,
  }) {
    return _then(_$LoginResponseImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl implements _LoginResponse {
  const _$LoginResponseImpl(
      {@JsonKey(name: 'AccessToken') required this.accessToken,
      @JsonKey(name: 'RefreshToken') required this.refreshToken,
      @JsonKey(name: 'ExpiresIn') required this.expiresIn,
      @JsonKey(name: 'TokenType') required this.tokenType,
      @JsonKey(name: 'User') required this.user});

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  @JsonKey(name: 'AccessToken')
  final String accessToken;
  @override
  @JsonKey(name: 'RefreshToken')
  final String refreshToken;
  @override
  @JsonKey(name: 'ExpiresIn')
  final int expiresIn;
  @override
  @JsonKey(name: 'TokenType')
  final String tokenType;
  @override
  @JsonKey(name: 'User')
  final UserDto user;

  @override
  String toString() {
    return 'LoginResponse(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, tokenType: $tokenType, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, accessToken, refreshToken, expiresIn, tokenType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse(
          {@JsonKey(name: 'AccessToken') required final String accessToken,
          @JsonKey(name: 'RefreshToken') required final String refreshToken,
          @JsonKey(name: 'ExpiresIn') required final int expiresIn,
          @JsonKey(name: 'TokenType') required final String tokenType,
          @JsonKey(name: 'User') required final UserDto user}) =
      _$LoginResponseImpl;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  @JsonKey(name: 'AccessToken')
  String get accessToken;
  @override
  @JsonKey(name: 'RefreshToken')
  String get refreshToken;
  @override
  @JsonKey(name: 'ExpiresIn')
  int get expiresIn;
  @override
  @JsonKey(name: 'TokenType')
  String get tokenType;
  @override
  @JsonKey(name: 'User')
  UserDto get user;
  @override
  @JsonKey(ignore: true)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  @JsonKey(name: 'Id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'FirstName')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastName')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Role')
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'Department')
  String? get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'JobTitle')
  String? get jobTitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') String id,
      @JsonKey(name: 'Email') String email,
      @JsonKey(name: 'FirstName') String firstName,
      @JsonKey(name: 'LastName') String lastName,
      @JsonKey(name: 'Role') String role,
      @JsonKey(name: 'Department') String? department,
      @JsonKey(name: 'JobTitle') String? jobTitle});
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? role = null,
    Object? department = freezed,
    Object? jobTitle = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      jobTitle: freezed == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDtoImplCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$UserDtoImplCopyWith(
          _$UserDtoImpl value, $Res Function(_$UserDtoImpl) then) =
      __$$UserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') String id,
      @JsonKey(name: 'Email') String email,
      @JsonKey(name: 'FirstName') String firstName,
      @JsonKey(name: 'LastName') String lastName,
      @JsonKey(name: 'Role') String role,
      @JsonKey(name: 'Department') String? department,
      @JsonKey(name: 'JobTitle') String? jobTitle});
}

/// @nodoc
class __$$UserDtoImplCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$UserDtoImpl>
    implements _$$UserDtoImplCopyWith<$Res> {
  __$$UserDtoImplCopyWithImpl(
      _$UserDtoImpl _value, $Res Function(_$UserDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? role = null,
    Object? department = freezed,
    Object? jobTitle = freezed,
  }) {
    return _then(_$UserDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      jobTitle: freezed == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDtoImpl implements _UserDto {
  const _$UserDtoImpl(
      {@JsonKey(name: 'Id') required this.id,
      @JsonKey(name: 'Email') required this.email,
      @JsonKey(name: 'FirstName') required this.firstName,
      @JsonKey(name: 'LastName') required this.lastName,
      @JsonKey(name: 'Role') required this.role,
      @JsonKey(name: 'Department') this.department,
      @JsonKey(name: 'JobTitle') this.jobTitle});

  factory _$UserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDtoImplFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final String id;
  @override
  @JsonKey(name: 'Email')
  final String email;
  @override
  @JsonKey(name: 'FirstName')
  final String firstName;
  @override
  @JsonKey(name: 'LastName')
  final String lastName;
  @override
  @JsonKey(name: 'Role')
  final String role;
  @override
  @JsonKey(name: 'Department')
  final String? department;
  @override
  @JsonKey(name: 'JobTitle')
  final String? jobTitle;

  @override
  String toString() {
    return 'UserDto(id: $id, email: $email, firstName: $firstName, lastName: $lastName, role: $role, department: $department, jobTitle: $jobTitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, email, firstName, lastName, role, department, jobTitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      __$$UserDtoImplCopyWithImpl<_$UserDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDtoImplToJson(
      this,
    );
  }
}

abstract class _UserDto implements UserDto {
  const factory _UserDto(
      {@JsonKey(name: 'Id') required final String id,
      @JsonKey(name: 'Email') required final String email,
      @JsonKey(name: 'FirstName') required final String firstName,
      @JsonKey(name: 'LastName') required final String lastName,
      @JsonKey(name: 'Role') required final String role,
      @JsonKey(name: 'Department') final String? department,
      @JsonKey(name: 'JobTitle') final String? jobTitle}) = _$UserDtoImpl;

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$UserDtoImpl.fromJson;

  @override
  @JsonKey(name: 'Id')
  String get id;
  @override
  @JsonKey(name: 'Email')
  String get email;
  @override
  @JsonKey(name: 'FirstName')
  String get firstName;
  @override
  @JsonKey(name: 'LastName')
  String get lastName;
  @override
  @JsonKey(name: 'Role')
  String get role;
  @override
  @JsonKey(name: 'Department')
  String? get department;
  @override
  @JsonKey(name: 'JobTitle')
  String? get jobTitle;
  @override
  @JsonKey(ignore: true)
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReservationDto _$ReservationDtoFromJson(Map<String, dynamic> json) {
  return _ReservationDto.fromJson(json);
}

/// @nodoc
mixin _$ReservationDto {
  @JsonKey(name: 'Id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ResourceType')
  String get resourceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'ResourceId')
  String get resourceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'StartsAt')
  String get startsAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndsAt')
  String get endsAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'Meta')
  Map<String, dynamic>? get meta => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'Id') String id,
      @JsonKey(name: 'ResourceType') String resourceType,
      @JsonKey(name: 'ResourceId') String resourceId,
      @JsonKey(name: 'StartsAt') String startsAt,
      @JsonKey(name: 'EndsAt') String endsAt,
      @JsonKey(name: 'Status') String status,
      @JsonKey(name: 'Meta') Map<String, dynamic>? meta});
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
    Object? resourceType = null,
    Object? resourceId = null,
    Object? startsAt = null,
    Object? endsAt = null,
    Object? status = null,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
      {@JsonKey(name: 'Id') String id,
      @JsonKey(name: 'ResourceType') String resourceType,
      @JsonKey(name: 'ResourceId') String resourceId,
      @JsonKey(name: 'StartsAt') String startsAt,
      @JsonKey(name: 'EndsAt') String endsAt,
      @JsonKey(name: 'Status') String status,
      @JsonKey(name: 'Meta') Map<String, dynamic>? meta});
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
    Object? resourceType = null,
    Object? resourceId = null,
    Object? startsAt = null,
    Object? endsAt = null,
    Object? status = null,
    Object? meta = freezed,
  }) {
    return _then(_$ReservationDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      meta: freezed == meta
          ? _value._meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationDtoImpl implements _ReservationDto {
  const _$ReservationDtoImpl(
      {@JsonKey(name: 'Id') required this.id,
      @JsonKey(name: 'ResourceType') required this.resourceType,
      @JsonKey(name: 'ResourceId') required this.resourceId,
      @JsonKey(name: 'StartsAt') required this.startsAt,
      @JsonKey(name: 'EndsAt') required this.endsAt,
      @JsonKey(name: 'Status') required this.status,
      @JsonKey(name: 'Meta') final Map<String, dynamic>? meta})
      : _meta = meta;

  factory _$ReservationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReservationDtoImplFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final String id;
  @override
  @JsonKey(name: 'ResourceType')
  final String resourceType;
  @override
  @JsonKey(name: 'ResourceId')
  final String resourceId;
  @override
  @JsonKey(name: 'StartsAt')
  final String startsAt;
  @override
  @JsonKey(name: 'EndsAt')
  final String endsAt;
  @override
  @JsonKey(name: 'Status')
  final String status;
  final Map<String, dynamic>? _meta;
  @override
  @JsonKey(name: 'Meta')
  Map<String, dynamic>? get meta {
    final value = _meta;
    if (value == null) return null;
    if (_meta is EqualUnmodifiableMapView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ReservationDto(id: $id, resourceType: $resourceType, resourceId: $resourceId, startsAt: $startsAt, endsAt: $endsAt, status: $status, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.resourceType, resourceType) ||
                other.resourceType == resourceType) &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._meta, _meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, resourceType, resourceId,
      startsAt, endsAt, status, const DeepCollectionEquality().hash(_meta));

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
          {@JsonKey(name: 'Id') required final String id,
          @JsonKey(name: 'ResourceType') required final String resourceType,
          @JsonKey(name: 'ResourceId') required final String resourceId,
          @JsonKey(name: 'StartsAt') required final String startsAt,
          @JsonKey(name: 'EndsAt') required final String endsAt,
          @JsonKey(name: 'Status') required final String status,
          @JsonKey(name: 'Meta') final Map<String, dynamic>? meta}) =
      _$ReservationDtoImpl;

  factory _ReservationDto.fromJson(Map<String, dynamic> json) =
      _$ReservationDtoImpl.fromJson;

  @override
  @JsonKey(name: 'Id')
  String get id;
  @override
  @JsonKey(name: 'ResourceType')
  String get resourceType;
  @override
  @JsonKey(name: 'ResourceId')
  String get resourceId;
  @override
  @JsonKey(name: 'StartsAt')
  String get startsAt;
  @override
  @JsonKey(name: 'EndsAt')
  String get endsAt;
  @override
  @JsonKey(name: 'Status')
  String get status;
  @override
  @JsonKey(name: 'Meta')
  Map<String, dynamic>? get meta;
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
  @JsonKey(name: 'ResourceType')
  String get resourceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'ResourceId')
  String get resourceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'StartsAt')
  String get startsAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndsAt')
  String get endsAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Meta')
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
      {@JsonKey(name: 'ResourceType') String resourceType,
      @JsonKey(name: 'ResourceId') String resourceId,
      @JsonKey(name: 'StartsAt') String startsAt,
      @JsonKey(name: 'EndsAt') String endsAt,
      @JsonKey(name: 'Meta') Map<String, dynamic>? meta});
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
      {@JsonKey(name: 'ResourceType') String resourceType,
      @JsonKey(name: 'ResourceId') String resourceId,
      @JsonKey(name: 'StartsAt') String startsAt,
      @JsonKey(name: 'EndsAt') String endsAt,
      @JsonKey(name: 'Meta') Map<String, dynamic>? meta});
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
      {@JsonKey(name: 'ResourceType') required this.resourceType,
      @JsonKey(name: 'ResourceId') required this.resourceId,
      @JsonKey(name: 'StartsAt') required this.startsAt,
      @JsonKey(name: 'EndsAt') required this.endsAt,
      @JsonKey(name: 'Meta') final Map<String, dynamic>? meta})
      : _meta = meta;

  factory _$CreateReservationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateReservationRequestImplFromJson(json);

  @override
  @JsonKey(name: 'ResourceType')
  final String resourceType;
  @override
  @JsonKey(name: 'ResourceId')
  final String resourceId;
  @override
  @JsonKey(name: 'StartsAt')
  final String startsAt;
  @override
  @JsonKey(name: 'EndsAt')
  final String endsAt;
  final Map<String, dynamic>? _meta;
  @override
  @JsonKey(name: 'Meta')
  Map<String, dynamic>? get meta {
    final value = _meta;
    if (value == null) return null;
    if (_meta is EqualUnmodifiableMapView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CreateReservationRequest(resourceType: $resourceType, resourceId: $resourceId, startsAt: $startsAt, endsAt: $endsAt, meta: $meta)';
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
            const DeepCollectionEquality().equals(other._meta, _meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, resourceType, resourceId,
      startsAt, endsAt, const DeepCollectionEquality().hash(_meta));

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
          {@JsonKey(name: 'ResourceType') required final String resourceType,
          @JsonKey(name: 'ResourceId') required final String resourceId,
          @JsonKey(name: 'StartsAt') required final String startsAt,
          @JsonKey(name: 'EndsAt') required final String endsAt,
          @JsonKey(name: 'Meta') final Map<String, dynamic>? meta}) =
      _$CreateReservationRequestImpl;

  factory _CreateReservationRequest.fromJson(Map<String, dynamic> json) =
      _$CreateReservationRequestImpl.fromJson;

  @override
  @JsonKey(name: 'ResourceType')
  String get resourceType;
  @override
  @JsonKey(name: 'ResourceId')
  String get resourceId;
  @override
  @JsonKey(name: 'StartsAt')
  String get startsAt;
  @override
  @JsonKey(name: 'EndsAt')
  String get endsAt;
  @override
  @JsonKey(name: 'Meta')
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
  @JsonKey(name: 'ResourceType')
  String? get resourceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'ResourceId')
  String? get resourceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'StartsAt')
  String? get startsAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndsAt')
  String? get endsAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'Meta')
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
      {@JsonKey(name: 'ResourceType') String? resourceType,
      @JsonKey(name: 'ResourceId') String? resourceId,
      @JsonKey(name: 'StartsAt') String? startsAt,
      @JsonKey(name: 'EndsAt') String? endsAt,
      @JsonKey(name: 'Status') String? status,
      @JsonKey(name: 'Meta') Map<String, dynamic>? meta});
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
      {@JsonKey(name: 'ResourceType') String? resourceType,
      @JsonKey(name: 'ResourceId') String? resourceId,
      @JsonKey(name: 'StartsAt') String? startsAt,
      @JsonKey(name: 'EndsAt') String? endsAt,
      @JsonKey(name: 'Status') String? status,
      @JsonKey(name: 'Meta') Map<String, dynamic>? meta});
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
      {@JsonKey(name: 'ResourceType') this.resourceType,
      @JsonKey(name: 'ResourceId') this.resourceId,
      @JsonKey(name: 'StartsAt') this.startsAt,
      @JsonKey(name: 'EndsAt') this.endsAt,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'Meta') final Map<String, dynamic>? meta})
      : _meta = meta;

  factory _$UpdateReservationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateReservationRequestImplFromJson(json);

  @override
  @JsonKey(name: 'ResourceType')
  final String? resourceType;
  @override
  @JsonKey(name: 'ResourceId')
  final String? resourceId;
  @override
  @JsonKey(name: 'StartsAt')
  final String? startsAt;
  @override
  @JsonKey(name: 'EndsAt')
  final String? endsAt;
  @override
  @JsonKey(name: 'Status')
  final String? status;
  final Map<String, dynamic>? _meta;
  @override
  @JsonKey(name: 'Meta')
  Map<String, dynamic>? get meta {
    final value = _meta;
    if (value == null) return null;
    if (_meta is EqualUnmodifiableMapView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'UpdateReservationRequest(resourceType: $resourceType, resourceId: $resourceId, startsAt: $startsAt, endsAt: $endsAt, status: $status, meta: $meta)';
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
            const DeepCollectionEquality().equals(other._meta, _meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, resourceType, resourceId,
      startsAt, endsAt, status, const DeepCollectionEquality().hash(_meta));

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
          {@JsonKey(name: 'ResourceType') final String? resourceType,
          @JsonKey(name: 'ResourceId') final String? resourceId,
          @JsonKey(name: 'StartsAt') final String? startsAt,
          @JsonKey(name: 'EndsAt') final String? endsAt,
          @JsonKey(name: 'Status') final String? status,
          @JsonKey(name: 'Meta') final Map<String, dynamic>? meta}) =
      _$UpdateReservationRequestImpl;

  factory _UpdateReservationRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateReservationRequestImpl.fromJson;

  @override
  @JsonKey(name: 'ResourceType')
  String? get resourceType;
  @override
  @JsonKey(name: 'ResourceId')
  String? get resourceId;
  @override
  @JsonKey(name: 'StartsAt')
  String? get startsAt;
  @override
  @JsonKey(name: 'EndsAt')
  String? get endsAt;
  @override
  @JsonKey(name: 'Status')
  String? get status;
  @override
  @JsonKey(name: 'Meta')
  Map<String, dynamic>? get meta;
  @override
  @JsonKey(ignore: true)
  _$$UpdateReservationRequestImplCopyWith<_$UpdateReservationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) {
  return _LocationDto.fromJson(json);
}

/// @nodoc
mixin _$LocationDto {
  @JsonKey(name: 'Id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Address')
  String? get address => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'Id') String id,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'Address') String? address});
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
    Object? address = freezed,
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
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: 'Id') String id,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'Address') String? address});
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
    Object? address = freezed,
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
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationDtoImpl implements _LocationDto {
  const _$LocationDtoImpl(
      {@JsonKey(name: 'Id') required this.id,
      @JsonKey(name: 'Name') required this.name,
      @JsonKey(name: 'Address') this.address});

  factory _$LocationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationDtoImplFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final String id;
  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'Address')
  final String? address;

  @override
  String toString() {
    return 'LocationDto(id: $id, name: $name, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address);

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
      {@JsonKey(name: 'Id') required final String id,
      @JsonKey(name: 'Name') required final String name,
      @JsonKey(name: 'Address') final String? address}) = _$LocationDtoImpl;

  factory _LocationDto.fromJson(Map<String, dynamic> json) =
      _$LocationDtoImpl.fromJson;

  @override
  @JsonKey(name: 'Id')
  String get id;
  @override
  @JsonKey(name: 'Name')
  String get name;
  @override
  @JsonKey(name: 'Address')
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$LocationDtoImplCopyWith<_$LocationDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeskDto _$DeskDtoFromJson(Map<String, dynamic> json) {
  return _DeskDto.fromJson(json);
}

/// @nodoc
mixin _$DeskDto {
  @JsonKey(name: 'Id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'ZoneId')
  String get zoneId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Features')
  List<String>? get features => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'Id') String id,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'ZoneId') String zoneId,
      @JsonKey(name: 'Features') List<String>? features});
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
    Object? name = null,
    Object? zoneId = null,
    Object? features = freezed,
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
      zoneId: null == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      {@JsonKey(name: 'Id') String id,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'ZoneId') String zoneId,
      @JsonKey(name: 'Features') List<String>? features});
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
    Object? name = null,
    Object? zoneId = null,
    Object? features = freezed,
  }) {
    return _then(_$DeskDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      zoneId: null == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
      features: freezed == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeskDtoImpl implements _DeskDto {
  const _$DeskDtoImpl(
      {@JsonKey(name: 'Id') required this.id,
      @JsonKey(name: 'Name') required this.name,
      @JsonKey(name: 'ZoneId') required this.zoneId,
      @JsonKey(name: 'Features') final List<String>? features})
      : _features = features;

  factory _$DeskDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeskDtoImplFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final String id;
  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'ZoneId')
  final String zoneId;
  final List<String>? _features;
  @override
  @JsonKey(name: 'Features')
  List<String>? get features {
    final value = _features;
    if (value == null) return null;
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DeskDto(id: $id, name: $name, zoneId: $zoneId, features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeskDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId) &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, zoneId,
      const DeepCollectionEquality().hash(_features));

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
      {@JsonKey(name: 'Id') required final String id,
      @JsonKey(name: 'Name') required final String name,
      @JsonKey(name: 'ZoneId') required final String zoneId,
      @JsonKey(name: 'Features') final List<String>? features}) = _$DeskDtoImpl;

  factory _DeskDto.fromJson(Map<String, dynamic> json) = _$DeskDtoImpl.fromJson;

  @override
  @JsonKey(name: 'Id')
  String get id;
  @override
  @JsonKey(name: 'Name')
  String get name;
  @override
  @JsonKey(name: 'ZoneId')
  String get zoneId;
  @override
  @JsonKey(name: 'Features')
  List<String>? get features;
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
  @JsonKey(name: 'Id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'LocationId')
  String get locationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Capacity')
  int get capacity => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'Id') String id,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'LocationId') String locationId,
      @JsonKey(name: 'Capacity') int capacity});
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
    Object? name = null,
    Object? locationId = null,
    Object? capacity = null,
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
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
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
      {@JsonKey(name: 'Id') String id,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'LocationId') String locationId,
      @JsonKey(name: 'Capacity') int capacity});
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
    Object? name = null,
    Object? locationId = null,
    Object? capacity = null,
  }) {
    return _then(_$RoomDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomDtoImpl implements _RoomDto {
  const _$RoomDtoImpl(
      {@JsonKey(name: 'Id') required this.id,
      @JsonKey(name: 'Name') required this.name,
      @JsonKey(name: 'LocationId') required this.locationId,
      @JsonKey(name: 'Capacity') required this.capacity});

  factory _$RoomDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomDtoImplFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final String id;
  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'LocationId')
  final String locationId;
  @override
  @JsonKey(name: 'Capacity')
  final int capacity;

  @override
  String toString() {
    return 'RoomDto(id: $id, name: $name, locationId: $locationId, capacity: $capacity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, locationId, capacity);

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
      {@JsonKey(name: 'Id') required final String id,
      @JsonKey(name: 'Name') required final String name,
      @JsonKey(name: 'LocationId') required final String locationId,
      @JsonKey(name: 'Capacity') required final int capacity}) = _$RoomDtoImpl;

  factory _RoomDto.fromJson(Map<String, dynamic> json) = _$RoomDtoImpl.fromJson;

  @override
  @JsonKey(name: 'Id')
  String get id;
  @override
  @JsonKey(name: 'Name')
  String get name;
  @override
  @JsonKey(name: 'LocationId')
  String get locationId;
  @override
  @JsonKey(name: 'Capacity')
  int get capacity;
  @override
  @JsonKey(ignore: true)
  _$$RoomDtoImplCopyWith<_$RoomDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
