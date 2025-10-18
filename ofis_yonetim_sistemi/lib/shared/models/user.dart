import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    String? displayName,
    String? avatarUrl,
    required List<String> roles,
    String? tenantId,
    String? organizationId,
    required DateTime createdAt,
    DateTime? lastLoginAt,
    @Default(true) bool isActive,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserClaims with _$UserClaims {
  const factory UserClaims({
    required String sub,
    required String email,
    String? name,
    String? givenName,
    String? familyName,
    String? picture,
    List<String>? roles,
    String? tenant,
    String? organization,
  }) = _UserClaims;

  factory UserClaims.fromJson(Map<String, dynamic> json) => _$UserClaimsFromJson(json);
}