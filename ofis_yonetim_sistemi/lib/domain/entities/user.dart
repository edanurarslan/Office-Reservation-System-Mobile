import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/user_role.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();
  
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
    String? department,
    String? jobTitle,
    required DateTime createdAt,
    DateTime? lastLoginAt,
    @Default(true) bool isActive,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  
  // Helper methods for role checking
  UserRole get primaryRole {
    if (roles.isEmpty) return UserRole.employee;
    // Check for highest role
    if (roles.any((r) => r.toLowerCase() == 'admin')) return UserRole.admin;
    if (roles.any((r) => r.toLowerCase() == 'manager')) return UserRole.manager;
    return UserRole.employee;
  }
  
  bool get isAdmin => primaryRole.isAdmin;
  bool get isManager => primaryRole.isManager;
  bool get isEmployee => primaryRole.isEmployee;
  
  bool get canManageUsers => primaryRole.canManageUsers;
  bool get canViewReports => primaryRole.canViewReports;
  bool get canManageResources => primaryRole.canManageResources;
  bool get canManageReservations => primaryRole.canManageReservations;
  
  String get fullName => '$firstName $lastName';
  String get roleDisplayName => primaryRole.displayName;
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