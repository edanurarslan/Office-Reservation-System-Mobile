import '../../domain/entities/reservation.dart';
import '../../domain/entities/resource.dart';
import '../../domain/repositories/reservation_repository.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  
  // Mock data - gerçek uygulamada database'den gelecek
  static List<Reservation> _mockReservations = [
    Reservation(
      id: '1',
      userId: '1',
      resourceId: 'meeting-room-1',
      resourceName: 'Toplantı Odası A',
      resourceType: ResourceType.meetingRoom,
      startsAt: DateTime.now().add(Duration(hours: 1)),
      endsAt: DateTime.now().add(Duration(hours: 2)),
      status: ReservationStatus.confirmed,
      notes: 'Haftalık ekip toplantısı',
      createdAt: DateTime.now().subtract(Duration(days: 1)),
    ),
    Reservation(
      id: '2',
      userId: '2',
      resourceId: 'desk-1',
      resourceName: 'Masa 1',
      resourceType: ResourceType.desk,
      startsAt: DateTime.now().add(Duration(hours: 3)),
      endsAt: DateTime.now().add(Duration(hours: 8)),
      status: ReservationStatus.confirmed,
      createdAt: DateTime.now().subtract(Duration(hours: 5)),
    ),
  ];

  static List<Resource> _mockResources = [
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

  @override
  Future<List<Reservation>> getAllReservations() async {
    // Simüle edilen network delay
    await Future.delayed(Duration(milliseconds: 500));
    return List.from(_mockReservations);
  }

  @override
  Future<List<Reservation>> getUserReservations(String userId) async {
    await Future.delayed(Duration(milliseconds: 300));
    return _mockReservations.where((r) => r.userId == userId).toList();
  }

  @override
  Future<List<Resource>> getAllResources() async {
    await Future.delayed(Duration(milliseconds: 400));
    return List.from(_mockResources);
  }

  @override
  Future<void> createReservation(Reservation reservation) async {
    await Future.delayed(Duration(milliseconds: 600));
    _mockReservations.add(reservation);
  }

  @override
  Future<void> updateReservation(Reservation reservation) async {
    await Future.delayed(Duration(milliseconds: 500));
    final index = _mockReservations.indexWhere((r) => r.id == reservation.id);
    if (index != -1) {
      _mockReservations[index] = reservation;
    }
  }

  @override
  Future<void> deleteReservation(String reservationId) async {
    await Future.delayed(Duration(milliseconds: 400));
    _mockReservations.removeWhere((r) => r.id == reservationId);
  }

  @override
  Future<bool> isTimeSlotAvailable(
    String resourceId, 
    DateTime startTime, 
    DateTime endTime, 
    {String? excludeReservationId}
  ) async {
    await Future.delayed(Duration(milliseconds: 200));
    
    final conflictingReservations = _mockReservations.where((reservation) {
      // Hariç tutulacak rezervasyonu kontrol et
      if (excludeReservationId != null && reservation.id == excludeReservationId) {
        return false;
      }
      
      // Aynı kaynak kontrolü
      if (reservation.resourceId != resourceId) {
        return false;
      }
      
      // İptal edilmiş rezervasyonları hariç tut
      if (reservation.status == ReservationStatus.cancelled) {
        return false;
      }
      
      // Zaman çakışması kontrolü
      return !(endTime.isBefore(reservation.startsAt) || 
               startTime.isAfter(reservation.endsAt));
    }).toList();
    
    return conflictingReservations.isEmpty;
  }
}