import 'dart:convert';
import 'package:http/http.dart' as http;

import '../core/constants/api_constants.dart';

class ApiService {
  // --- Auth (existing) ---
  Future<Map<String, dynamic>?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.login),
      headers: {ApiConstants.headerContentType: ApiConstants.contentTypeJson},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  Future<void> logout(String token) async {
    await http.post(
      Uri.parse(ApiConstants.baseUrl + '/api/v1/auth/logout'),
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
        ApiConstants.headerAuthorization: '${ApiConstants.bearerPrefix} $token',
      },
    );
  }

  // --- LOGS ---
  Future<Map<String, dynamic>> getLogs({
    String? search,
    String? action,
    String? status,
    String? entityType,
    String? userId,
    String? from,
    String? to,
    int? page,
    int? pageSize,
    String? token,
  }) async {
    final params = <String, String>{};
    if (search != null && search.isNotEmpty) params['search'] = search;
    if (action != null && action != 'all') params['action'] = action;
    if (status != null && status != 'all') params['status'] = status;
    if (entityType != null && entityType != 'all') params['entityType'] = entityType;
    if (userId != null) params['userId'] = userId;
    if (from != null) params['from'] = from;
    if (to != null) params['to'] = to;
    if (page != null) params['page'] = page.toString();
    if (pageSize != null) params['pageSize'] = pageSize.toString();
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.logs).replace(queryParameters: params);
    final response = await http.get(
      uri,
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
        if (token != null) ApiConstants.headerAuthorization: '${ApiConstants.bearerPrefix} $token',
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch logs');
    }
  }

  Future<List<String>> getLogActions({String? token}) async {
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.logs + '/actions');
    final response = await http.get(
      uri,
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
        if (token != null) ApiConstants.headerAuthorization: '${ApiConstants.bearerPrefix} $token',
      },
    );
    if (response.statusCode == 200) {
      return List<String>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch log actions');
    }
  }

  Future<List<String>> getLogEntityTypes({String? token}) async {
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.logs + '/entity-types');
    final response = await http.get(
      uri,
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
        if (token != null) ApiConstants.headerAuthorization: '${ApiConstants.bearerPrefix} $token',
      },
    );
    if (response.statusCode == 200) {
      return List<String>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch log entity types');
    }
  }

  Future<Map<String, dynamic>> getLogStats({String? token}) async {
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.logs + '/stats');
    final response = await http.get(
      uri,
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
        if (token != null) ApiConstants.headerAuthorization: '${ApiConstants.bearerPrefix} $token',
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch log stats');
    }
  }

  Future<void> cleanupOldLogs({int olderThanDays = 90, String? token}) async {
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.logs + '/cleanup?olderThanDays=$olderThanDays');
    final response = await http.delete(
      uri,
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
        if (token != null) ApiConstants.headerAuthorization: '${ApiConstants.bearerPrefix} $token',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to cleanup old logs');
    }
  }

  // --- RULES ---
  Future<List<Map<String, dynamic>>> getRules({String? token}) async {
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.rules);
    final response = await http.get(
      uri,
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
        if (token != null) ApiConstants.headerAuthorization: '${ApiConstants.bearerPrefix} $token',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to fetch rules');
    }
  }

  Future<Map<String, dynamic>> createRule({
    required String name,
    required String description,
    required String ruleType,
    required int priority,
    bool isActive = true,
    String? configuration,
    String? token,
  }) async {
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.rules);
    final response = await http.post(
      uri,
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
        if (token != null) ApiConstants.headerAuthorization: '${ApiConstants.bearerPrefix} $token',
      },
      body: jsonEncode({
        'name': name,
        'description': description,
        'type': ruleType,
        'priority': priority,
        'isActive': isActive,
        'configuration': configuration ?? '',
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create rule');
    }
  }

  Future<Map<String, dynamic>> updateRule({
    required String id,
    String? name,
    String? description,
    int? priority,
    bool? isActive,
    String? configuration,
    String? token,
  }) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.rules}/$id');
    final body = <String, dynamic>{};
    if (name != null) body['name'] = name;
    if (description != null) body['description'] = description;
    if (priority != null) body['priority'] = priority;
    if (isActive != null) body['isActive'] = isActive;
    if (configuration != null) body['configuration'] = configuration;
    
    final response = await http.put(
      uri,
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
        if (token != null) ApiConstants.headerAuthorization: '${ApiConstants.bearerPrefix} $token',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update rule');
    }
  }

  Future<void> deleteRule({required String id, String? token}) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.rules}/$id');
    final response = await http.delete(
      uri,
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
        if (token != null) ApiConstants.headerAuthorization: '${ApiConstants.bearerPrefix} $token',
      },
    );
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Failed to delete rule');
    }
  }

  Future<void> toggleRuleStatus({required String id, required bool isActive, String? token}) async {
    await updateRule(id: id, isActive: isActive, token: token);
  }
}
