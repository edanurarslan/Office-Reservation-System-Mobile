import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_models.freezed.dart';
part 'api_models.g.dart';

@freezed
sealed class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.success(T data) = ApiSuccess<T>;
  const factory ApiResponse.error(ApiError error) = ApiFailure<T>;
}

@freezed
class ApiError with _$ApiError {
  const factory ApiError({
    required String message,
    String? code,
    int? statusCode,
    Map<String, dynamic>? details,
    String? correlationId,
  }) = _ApiError;

  factory ApiError.fromJson(Map<String, dynamic> json) => _$ApiErrorFromJson(json);
}

@freezed
class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse({
    required List<T> data,
    required int page,
    required int limit,
    required int total,
    required int totalPages,
    bool? hasNext,
    bool? hasPrevious,
  }) = _PaginatedResponse<T>;

  // Manual fromJson implementation for generic types
  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PaginatedResponse<T>(
      data: (json['data'] as List<dynamic>)
          .map((item) => fromJsonT(item as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      limit: json['limit'] as int,
      total: json['total'] as int,
      totalPages: json['totalPages'] as int,
      hasNext: json['hasNext'] as bool?,
      hasPrevious: json['hasPrevious'] as bool?,
    );
  }
}

@freezed
class FilterOptions with _$FilterOptions {
  const factory FilterOptions({
    String? locationId,
    String? zoneId,
    String? floorId,
    int? minCapacity,
    int? maxCapacity,
    List<String>? amenities,
    DateTime? startDate,
    DateTime? endDate,
    List<String>? resourceTypes,
  }) = _FilterOptions;

  factory FilterOptions.fromJson(Map<String, dynamic> json) => _$FilterOptionsFromJson(json);
}