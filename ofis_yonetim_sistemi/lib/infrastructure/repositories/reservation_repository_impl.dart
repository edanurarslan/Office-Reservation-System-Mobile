import '../../domain/entities/reservation.dart';
import '../../domain/entities/resource.dart';
import '../../domain/repositories/reservation_repository.dart';
import '../datasources/reservation_api_datasource.dart';
import '../models/api_response.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationApiDataSource apiDataSource;

  ReservationRepositoryImpl({required this.apiDataSource});

  @override
  Future<List<Reservation>> getAllReservations() async {
    try {
      final dtoList = await apiDataSource.getReservations();
      return dtoList.map((dto) => _dtoToEntity(dto)).toList();
    } catch (e) {
      print('Get all reservations error: $e');
      return [];
    }
  }

  @override
  Future<List<Reservation>> getUserReservations(String userId) async {
    try {
      final dtoList = await apiDataSource.getReservations(userId: userId);
      return dtoList.map((dto) => _dtoToEntity(dto)).toList();
    } catch (e) {
      print('Get user reservations error: $e');
      return [];
    }
  }

  @override
  Future<List<Resource>> getAllResources() async {
    return _getMockResources();
  }

  @override
  Future<void> createReservation(Reservation reservation) async {
    try {
      final request = CreateReservationRequest(
        resourceType: _mapResourceTypeToString(reservation.resourceType),
        resourceId: reservation.resourceId,
        startsAt: reservation.startsAt.toIso8601String(),
        endsAt: reservation.endsAt.toIso8601String(),
        meta: reservation.metadata,
      );
      
      await apiDataSource.createReservation(request);
    } catch (e) {
      print('Create reservation error: $e');
      rethrow;
    }
  }

  @override
  Future<void> updateReservation(Reservation reservation) async {
    try {
      final request = UpdateReservationRequest(
        resourceType: _mapResourceTypeToString(reservation.resourceType),
        resourceId: reservation.resourceId,
        startsAt: reservation.startsAt.toIso8601String(),
        endsAt: reservation.endsAt.toIso8601String(),
        status: _mapStatusToString(reservation.status),
        meta: reservation.metadata,
      );
      
      await apiDataSource.updateReservation(reservation.id, request);
    } catch (e) {
      print('Update reservation error: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteReservation(String reservationId) async {
    try {
      await apiDataSource.deleteReservation(reservationId);
    } catch (e) {
      print('Delete reservation error: $e');
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
        if (excludeReservationId != null && 
            reservation.id == excludeReservationId) {
          return false;
        }
        
        if (reservation.resourceId != resourceId) {
          return false;
        }
        
        if (reservation.status == ReservationStatus.cancelled) {
          return false;
        }
        
        return !(endTime.isBefore(reservation.startsAt) ||
            startTime.isAfter(reservation.endsAt));
      }).toList();
      
      return conflictingReservations.isEmpty;
    } catch (e) {
      print('Time slot availability check error: $e');
      return false;
    }
  }

  Reservation _dtoToEntity(ReservationDto dto) {
    return Reservation(
      id: dto.id,
      userId: 'current-user-id',
      resourceId: dto.resourceId,
      resourceName: _getResourceName(dto.resourceId),
      resourceType: _mapStringToResourceType(dto.resourceType),
      startsAt: DateTime.parse(dto.startsAt),
      endsAt: DateTime.parse(dto.endsAt),
      status: _mapStringToStatus(dto.status),
      metadata: dto.meta,
      createdAt: DateTime.now(),
    );
  }

  String _mapResourceTypeToString(ResourceType type) {
    switch (type) {
      case ResourceType.desk:
        return 'desk';
      case ResourceType.meetingRoom:
        return 'room';
      case ResourceType.parkingSpace:
        return 'parking';
      default:
        return 'desk';
    }
  }

  ResourceType _mapStringToResourceType(String typeStr) {
    switch (typeStr.toLowerCase()) {
      case 'desk':
        return ResourceType.desk;
      case 'room':
      case 'meetingroom':
        return ResourceType.meetingRoom;
      case 'parking':
        return ResourceType.parkingSpace;
      default:
        return ResourceType.desk;
    }
  }

  String _mapStatusToString(ReservationStatus status) {
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
        return 'CheckedOut';
      case ReservationStatus.noShow:
        return 'NoShow';
      case ReservationStatus.expired:
        return 'Expired';
    }
  }

  ReservationStatus _mapStringToStatus(String statusStr) {
    switch (statusStr) {
      case 'Pending':
        return ReservationStatus.pending;
      case 'Confirmed':
        return ReservationStatus.confirmed;
      case 'Cancelled':
        return ReservationStatus.cancelled;
      case 'CheckedIn':
        return ReservationStatus.checkedIn;
      case 'CheckedOut':
        return ReservationStatus.checkedOut;
      case 'NoShow':
        return ReservationStatus.noShow;
      case 'Expired':
        return ReservationStatus.expired;
      default:
        return ReservationStatus.pending;
    }
  }

  String _getResourceName(String resourceId) {
    return 'Resource $resourceId';
  }

  List<Resource> _getMockResources() {
    return [
      Resource(
        id: 'meeting-room-1',
        name: 'Toplantı Odası A',
        type: ResourceType.meetingRoom,
        capacity: 8,
        description: 'Projeksiyon ve beyaz tahta bulunan toplantı odası',
        locationId: 'location-1',
        locationName: '1. Kat, Kuzey Koridor',
        amenities: ['Projeksiyon', 'Beyaz Tahta', 'Kahve Makinesi'],
        isActive: true,
      ),
      Resource(
        id: 'desk-1',
        name: 'Masa 1',
        type: ResourceType.desk,
        capacity: 1,
        description: 'Pencere kenarında sessiz çalışma masası',
        locationId: 'location-2',
        locationName: '2. Kat, Güney Bölüm',
        amenities: ['Doğal Işık', 'Ethernet', 'Monitör'],
        isActive: true,
      ),
      Resource(
        id: 'parking-1',
        name: 'Otopark Alanı 1',
        type: ResourceType.parkingSpace,
        capacity: 1,
        description: 'Kapalı otopark',
        locationId: 'location-3',
        locationName: 'Bodrum Kat',
        amenities: ['Kapalı', 'Güvenlik Kamerası'],
        isActive: true,
      ),
    ];
  }
}
