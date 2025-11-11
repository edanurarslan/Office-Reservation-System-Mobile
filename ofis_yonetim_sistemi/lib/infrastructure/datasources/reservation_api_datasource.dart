import 'package:dio/dio.dart';
import '../models/api_response.dart';
import '../../core/constants/api_constants.dart';

/// Reservation API Data Source
class ReservationApiDataSource {
  final Dio dio;

  ReservationApiDataSource(this.dio);

  /// Get all reservations with optional filters
  Future<List<ReservationDto>> getReservations({
    String? userId,
    String? from,
    String? to,
    String? status,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (userId != null) queryParams['userId'] = userId;
      if (from != null) queryParams['from'] = from;
      if (to != null) queryParams['to'] = to;
      if (status != null) queryParams['status'] = status;

      final response = await dio.get(
        ApiConstants.reservations,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        return data.map((json) => ReservationDto.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Failed to load reservations');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load reservations: ${e.message}');
    }
  }

  /// Get reservation by ID
  Future<ReservationDto> getReservationById(String id) async {
    try {
      final response = await dio.get(ApiConstants.reservationById(id));

      if (response.statusCode == 200) {
        return ReservationDto.fromJson(response.data);
      } else {
        throw Exception('Reservation not found');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load reservation: ${e.message}');
    }
  }

  /// Create new reservation
  Future<ReservationDto> createReservation(
    CreateReservationRequest request,
  ) async {
    try {
      final response = await dio.post(
        ApiConstants.reservations,
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return ReservationDto.fromJson(response.data);
      } else if (response.statusCode == 409) {
        throw Exception('RESERVATION_CONFLICT: Resource is not available for the given time range');
      } else {
        throw Exception('Failed to create reservation');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        final error = e.response?.data['error'];
        throw Exception(error['message'] ?? 'Resource is not available');
      }
      throw Exception('Failed to create reservation: ${e.message}');
    }
  }

  /// Update reservation
  Future<ReservationDto> updateReservation(
    String id,
    UpdateReservationRequest request,
  ) async {
    try {
      final response = await dio.patch(
        ApiConstants.reservationById(id),
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return ReservationDto.fromJson(response.data);
      } else {
        throw Exception('Failed to update reservation');
      }
    } on DioException catch (e) {
      throw Exception('Failed to update reservation: ${e.message}');
    }
  }

  /// Delete reservation
  Future<void> deleteReservation(String id) async {
    try {
      final response = await dio.delete(ApiConstants.reservationById(id));

      if (response.statusCode != 204 && response.statusCode != 200) {
        throw Exception('Failed to delete reservation');
      }
    } on DioException catch (e) {
      throw Exception('Failed to delete reservation: ${e.message}');
    }
  }

  /// Cancel reservation (update status to cancelled)
  Future<ReservationDto> cancelReservation(String id) async {
    return updateReservation(
      id,
      const UpdateReservationRequest(status: 'Cancelled'),
    );
  }
}
