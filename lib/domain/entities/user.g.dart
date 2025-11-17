// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      displayName: json['displayName'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
      tenantId: json['tenantId'] as String?,
      organizationId: json['organizationId'] as String?,
      department: json['department'] as String?,
      jobTitle: json['jobTitle'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastLoginAt: json['lastLoginAt'] == null
          ? null
          : DateTime.parse(json['lastLoginAt'] as String),
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'displayName': instance.displayName,
      'avatarUrl': instance.avatarUrl,
      'roles': instance.roles,
      'tenantId': instance.tenantId,
      'organizationId': instance.organizationId,
      'department': instance.department,
      'jobTitle': instance.jobTitle,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
      'isActive': instance.isActive,
    };

_$UserClaimsImpl _$$UserClaimsImplFromJson(Map<String, dynamic> json) =>
    _$UserClaimsImpl(
      sub: json['sub'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      givenName: json['givenName'] as String?,
      familyName: json['familyName'] as String?,
      picture: json['picture'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      tenant: json['tenant'] as String?,
      organization: json['organization'] as String?,
    );

Map<String, dynamic> _$$UserClaimsImplToJson(_$UserClaimsImpl instance) =>
    <String, dynamic>{
      'sub': instance.sub,
      'email': instance.email,
      'name': instance.name,
      'givenName': instance.givenName,
      'familyName': instance.familyName,
      'picture': instance.picture,
      'roles': instance.roles,
      'tenant': instance.tenant,
      'organization': instance.organization,
    };
