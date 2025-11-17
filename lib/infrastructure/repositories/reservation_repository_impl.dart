import '../../domain/entities/reservation.dart';
import '../../domain/entities/resource.dart';
import '../../domain/repositories/reservation_repository.dart';
import '../../domain/models/reservation_model.dart'
    as res_model;
import '../network/api_service.dart';
import '../seed/seed_resources.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ApiService apiService;

  ReservationRepositoryImpl({required this.apiService});

  @override
  Future<List<Reservation>> getAllReservations() async {
    try {
      final apiResponseList = await apiService.getReservations();
      return apiResponseList.map((dto) => _mapDtoToEntity(dto)).toList();
    } catch (e) {
      print('❌ Get all reservations error: $e');
      return [];
    }
  }

  @override
  Future<List<Reservation>> getUserReservations(String userId) async {
    try {
      final apiResponseList = await apiService.getReservations(userId: userId);
      return apiResponseList.map((dto) => _mapDtoToEntity(dto)).toList();
    } catch (e) {
      print('❌ Get user reservations error: $e');
      return [];
    }
  }

  @override
  Future<List<Resource>> getAllResources() async {
    // Return seed resources directly for offline-first development
    return SeedResources.getActive();
  }

  @override
  Future<void> createReservation(Reservation reservation) async {
    try {
      await apiService.createReservation(
        resourceId: reservation.resourceId,
        resourceType: _mapDomainResourceTypeToString(reservation.resourceType),
        startsAt: reservation.startsAt.toIso8601String(),
        endsAt: reservation.endsAt.toIso8601String(),
      );
    } catch (e) {
      print('❌ Create reservation error: $e');
      rethrow;
    }
  }

  @override
  Future<void> updateReservation(Reservation reservation) async {
    try {
      await apiService.updateReservation(
        id: reservation.id,
        resourceId: reservation.resourceId,
        resourceType: _mapDomainResourceTypeToString(reservation.resourceType),
        startsAt: reservation.startsAt.toIso8601String(),
        endsAt: reservation.endsAt.toIso8601String(),
        status: _mapDomainStatusToString(reservation.status),
      );
    } catch (e) {
      print('❌ Update reservation error: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteReservation(String reservationId) async {
    try {
      await apiService.deleteReservation(reservationId);
    } catch (e) {
      print('❌ Delete reservation error: $e');
      rethrow;
    }
  }

  @override
  Future<bool> isTimeSlotAvailable(
    String resourceId,
    DateTime startTime,
    DateTime endTime, {
    String? excludeReservationId,
  }) async {
    try {
      final allReservations = await getAllReservations();

      final conflictingReservations = allReservations.where((reservation) {
        if (excludeReservationId != null && reservation.id == excludeReservationId) {
          return false;
        }

        if (reservation.resourceId != resourceId) {
          return false;
        }

        if (reservation.status == ReservationStatus.cancelled) {
          return false;
        }

        return !(endTime.isBefore(reservation.startsAt) || startTime.isAfter(reservation.endsAt));
      }).toList();

      return conflictingReservations.isEmpty;
    } catch (e) {
      print('❌ Time slot availability check error: $e');
      return false;
    }
  }

  /// Map ReservationDto to domain entity
  Reservation _mapDtoToEntity(res_model.ReservationDto dto) {
    return Reservation(
      id: dto.id,
      userId: dto.userId,
      resourceId: dto.resourceId,
      resourceName: dto.purpose ?? 'Resource',
      resourceType: _mapApiResourceTypeToDomain(dto.resourceType),
      startsAt: dto.startsAt,
      endsAt: dto.endsAt,
      status: _mapApiStatusToDomain(dto.status),
      metadata: {'notes': dto.notes, 'purpose': dto.purpose},
      createdAt: DateTime.now(),
    );
  }

  /// Map domain ResourceType to API string
  String _mapDomainResourceTypeToString(ResourceType type) {
    switch (type) {
      case ResourceType.desk:
        return 'Desk';
      case ResourceType.room:
        return 'Room';
      case ResourceType.meetingRoom:
        return 'Room';
      case ResourceType.phoneBooth:
        return 'Booth';
      case ResourceType.parkingSpace:
        return 'Parking';
    }
  }

  /// Map API ResourceType enum to domain ResourceType
  ResourceType _mapApiResourceTypeToDomain(res_model.ResourceType apiType) {
    switch (apiType) {
      case res_model.ResourceType.desk:
        return ResourceType.desk;
      case res_model.ResourceType.room:
        return ResourceType.room;
    }
  }

  /// Map API string to domain ReservationStatus
  ReservationStatus _mapApiStatusToDomain(
      res_model.ReservationStatus apiStatus) {
    switch (apiStatus) {
      case res_model.ReservationStatus.pending:
        return ReservationStatus.pending;
      case res_model.ReservationStatus.confirmed:
        return ReservationStatus.confirmed;
      case res_model.ReservationStatus.checkedIn:
        return ReservationStatus.checkedIn;
      case res_model.ReservationStatus.completed:
        return ReservationStatus.checkedOut;
      case res_model.ReservationStatus.cancelled:
        return ReservationStatus.cancelled;
      case res_model.ReservationStatus.noShow:
        return ReservationStatus.noShow;
    }
  }

  /// Map domain ReservationStatus to API string
  String _mapDomainStatusToString(ReservationStatus status) {
    switch (status) {
      case ReservationStatus.pending:
        return 'Pending';
      case ReservationStatus.confirmed:
        return 'Confirmed';
      case ReservationStatus.cancelled:
        return 'Cancelled';
      case ReservationStatus.checkedIn:
        return 'CheckedIn';
      case ReservationStatus.checkedOut:
        return 'Completed';
      case ReservationStatus.noShow:
        return 'NoShow';
      case ReservationStatus.expired:
        return 'Cancelled';
    }
  }
}
