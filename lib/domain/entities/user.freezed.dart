// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  List<String> get roles => throw _privateConstructorUsedError;
  String? get tenantId => throw _privateConstructorUsedError;
  String? get organizationId => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  String? get jobTitle => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String email,
      String firstName,
      String lastName,
      String? displayName,
      String? avatarUrl,
      List<String> roles,
      String? tenantId,
      String? organizationId,
      String? department,
      String? jobTitle,
      DateTime createdAt,
      DateTime? lastLoginAt,
      bool isActive});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

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
    Object? displayName = freezed,
    Object? avatarUrl = freezed,
    Object? roles = null,
    Object? tenantId = freezed,
    Object? organizationId = freezed,
    Object? department = freezed,
    Object? jobTitle = freezed,
    Object? createdAt = null,
    Object? lastLoginAt = freezed,
    Object? isActive = null,
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
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      jobTitle: freezed == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String firstName,
      String lastName,
      String? displayName,
      String? avatarUrl,
      List<String> roles,
      String? tenantId,
      String? organizationId,
      String? department,
      String? jobTitle,
      DateTime createdAt,
      DateTime? lastLoginAt,
      bool isActive});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? displayName = freezed,
    Object? avatarUrl = freezed,
    Object? roles = null,
    Object? tenantId = freezed,
    Object? organizationId = freezed,
    Object? department = freezed,
    Object? jobTitle = freezed,
    Object? createdAt = null,
    Object? lastLoginAt = freezed,
    Object? isActive = null,
  }) {
    return _then(_$UserImpl(
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
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: null == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      jobTitle: freezed == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl extends _User {
  const _$UserImpl(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      this.displayName,
      this.avatarUrl,
      required final List<String> roles,
      this.tenantId,
      this.organizationId,
      this.department,
      this.jobTitle,
      required this.createdAt,
      this.lastLoginAt,
      this.isActive = true})
      : _roles = roles,
        super._();

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? displayName;
  @override
  final String? avatarUrl;
  final List<String> _roles;
  @override
  List<String> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final String? tenantId;
  @override
  final String? organizationId;
  @override
  final String? department;
  @override
  final String? jobTitle;
  @override
  final DateTime createdAt;
  @override
  final DateTime? lastLoginAt;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'User(id: $id, email: $email, firstName: $firstName, lastName: $lastName, displayName: $displayName, avatarUrl: $avatarUrl, roles: $roles, tenantId: $tenantId, organizationId: $organizationId, department: $department, jobTitle: $jobTitle, createdAt: $createdAt, lastLoginAt: $lastLoginAt, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      firstName,
      lastName,
      displayName,
      avatarUrl,
      const DeepCollectionEquality().hash(_roles),
      tenantId,
      organizationId,
      department,
      jobTitle,
      createdAt,
      lastLoginAt,
      isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {required final String id,
      required final String email,
      required final String firstName,
      required final String lastName,
      final String? displayName,
      final String? avatarUrl,
      required final List<String> roles,
      final String? tenantId,
      final String? organizationId,
      final String? department,
      final String? jobTitle,
      required final DateTime createdAt,
      final DateTime? lastLoginAt,
      final bool isActive}) = _$UserImpl;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get displayName;
  @override
  String? get avatarUrl;
  @override
  List<String> get roles;
  @override
  String? get tenantId;
  @override
  String? get organizationId;
  @override
  String? get department;
  @override
  String? get jobTitle;
  @override
  DateTime get createdAt;
  @override
  DateTime? get lastLoginAt;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserClaims _$UserClaimsFromJson(Map<String, dynamic> json) {
  return _UserClaims.fromJson(json);
}

/// @nodoc
mixin _$UserClaims {
  String get sub => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get givenName => throw _privateConstructorUsedError;
  String? get familyName => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  List<String>? get roles => throw _privateConstructorUsedError;
  String? get tenant => throw _privateConstructorUsedError;
  String? get organization => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserClaimsCopyWith<UserClaims> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserClaimsCopyWith<$Res> {
  factory $UserClaimsCopyWith(
          UserClaims value, $Res Function(UserClaims) then) =
      _$UserClaimsCopyWithImpl<$Res, UserClaims>;
  @useResult
  $Res call(
      {String sub,
      String email,
      String? name,
      String? givenName,
      String? familyName,
      String? picture,
      List<String>? roles,
      String? tenant,
      String? organization});
}

/// @nodoc
class _$UserClaimsCopyWithImpl<$Res, $Val extends UserClaims>
    implements $UserClaimsCopyWith<$Res> {
  _$UserClaimsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sub = null,
    Object? email = null,
    Object? name = freezed,
    Object? givenName = freezed,
    Object? familyName = freezed,
    Object? picture = freezed,
    Object? roles = freezed,
    Object? tenant = freezed,
    Object? organization = freezed,
  }) {
    return _then(_value.copyWith(
      sub: null == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: freezed == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      familyName: freezed == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tenant: freezed == tenant
          ? _value.tenant
          : tenant // ignore: cast_nullable_to_non_nullable
              as String?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserClaimsImplCopyWith<$Res>
    implements $UserClaimsCopyWith<$Res> {
  factory _$$UserClaimsImplCopyWith(
          _$UserClaimsImpl value, $Res Function(_$UserClaimsImpl) then) =
      __$$UserClaimsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sub,
      String email,
      String? name,
      String? givenName,
      String? familyName,
      String? picture,
      List<String>? roles,
      String? tenant,
      String? organization});
}

/// @nodoc
class __$$UserClaimsImplCopyWithImpl<$Res>
    extends _$UserClaimsCopyWithImpl<$Res, _$UserClaimsImpl>
    implements _$$UserClaimsImplCopyWith<$Res> {
  __$$UserClaimsImplCopyWithImpl(
      _$UserClaimsImpl _value, $Res Function(_$UserClaimsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sub = null,
    Object? email = null,
    Object? name = freezed,
    Object? givenName = freezed,
    Object? familyName = freezed,
    Object? picture = freezed,
    Object? roles = freezed,
    Object? tenant = freezed,
    Object? organization = freezed,
  }) {
    return _then(_$UserClaimsImpl(
      sub: null == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: freezed == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      familyName: freezed == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: freezed == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tenant: freezed == tenant
          ? _value.tenant
          : tenant // ignore: cast_nullable_to_non_nullable
              as String?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserClaimsImpl implements _UserClaims {
  const _$UserClaimsImpl(
      {required this.sub,
      required this.email,
      this.name,
      this.givenName,
      this.familyName,
      this.picture,
      final List<String>? roles,
      this.tenant,
      this.organization})
      : _roles = roles;

  factory _$UserClaimsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserClaimsImplFromJson(json);

  @override
  final String sub;
  @override
  final String email;
  @override
  final String? name;
  @override
  final String? givenName;
  @override
  final String? familyName;
  @override
  final String? picture;
  final List<String>? _roles;
  @override
  List<String>? get roles {
    final value = _roles;
    if (value == null) return null;
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? tenant;
  @override
  final String? organization;

  @override
  String toString() {
    return 'UserClaims(sub: $sub, email: $email, name: $name, givenName: $givenName, familyName: $familyName, picture: $picture, roles: $roles, tenant: $tenant, organization: $organization)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserClaimsImpl &&
            (identical(other.sub, sub) || other.sub == sub) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.givenName, givenName) ||
                other.givenName == givenName) &&
            (identical(other.familyName, familyName) ||
                other.familyName == familyName) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.tenant, tenant) || other.tenant == tenant) &&
            (identical(other.organization, organization) ||
                other.organization == organization));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sub,
      email,
      name,
      givenName,
      familyName,
      picture,
      const DeepCollectionEquality().hash(_roles),
      tenant,
      organization);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserClaimsImplCopyWith<_$UserClaimsImpl> get copyWith =>
      __$$UserClaimsImplCopyWithImpl<_$UserClaimsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserClaimsImplToJson(
      this,
    );
  }
}

abstract class _UserClaims implements UserClaims {
  const factory _UserClaims(
      {required final String sub,
      required final String email,
      final String? name,
      final String? givenName,
      final String? familyName,
      final String? picture,
      final List<String>? roles,
      final String? tenant,
      final String? organization}) = _$UserClaimsImpl;

  factory _UserClaims.fromJson(Map<String, dynamic> json) =
      _$UserClaimsImpl.fromJson;

  @override
  String get sub;
  @override
  String get email;
  @override
  String? get name;
  @override
  String? get givenName;
  @override
  String? get familyName;
  @override
  String? get picture;
  @override
  List<String>? get roles;
  @override
  String? get tenant;
  @override
  String? get organization;
  @override
  @JsonKey(ignore: true)
  _$$UserClaimsImplCopyWith<_$UserClaimsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
