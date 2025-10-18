import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/reservation.dart';
import '../../domain/entities/resource.dart';

// Mock data - gerçek API'ye bağlanana kadar kullanacağız
class MockDataService {
  static List<Resource> getMockResources() {
    return [
      Resource(
        id: '1',
        name: 'Toplantı Odası A',
        type: ResourceType.meetingRoom,
        description: 'Projektör ve beyaz tahta bulunan toplantı odası',
        locationId: 'loc1',
        locationName: '1. Kat',
        capacity: 8,
        amenities: ['Projektör', 'Beyaz Tahta', 'Klima', 'WiFi'],
        isActive: true,
      ),
      Resource(
        id: '2',
        name: 'Toplantı Odası B',
        type: ResourceType.meetingRoom,
        description: 'Büyük toplantı odası, video konferans imkanı',
        locationId: 'loc2',
        locationName: '2. Kat',
        capacity: 12,
        amenities: ['Video Konferans', 'Projektör', 'Ses Sistemi', 'Klima'],
        isActive: true,
      ),
      Resource(
        id: '3',
        name: 'Çalışma Masası 1',
        type: ResourceType.desk,
        description: 'Pencere kenarında sessiz çalışma masası',
        locationId: 'loc3',
        locationName: 'Açık Ofis',
        capacity: 1,
        amenities: ['Doğal Işık', 'Elektrik Soketi', 'WiFi'],
        isActive: true,
      ),
      Resource(
        id: '4',
        name: 'Çalışma Masası 2',
        type: ResourceType.desk,
        description: 'Açık ofis alanında ergonomik masa',
        locationId: 'loc3',
        locationName: 'Açık Ofis',
        capacity: 1,
        amenities: ['Ayarlanabilir Masa', 'Elektrik Soketi', 'WiFi'],
        isActive: true,
      ),
      Resource(
        id: '5',
        name: 'Telefon Kabini',
        type: ResourceType.phoneBooth,
        description: 'Sessiz telefon görüşmeleri için kabin',
        locationId: 'loc4',
        locationName: 'Koridor',
        capacity: 1,
        amenities: ['Ses Yalıtımı', 'Elektrik Soketi', 'WiFi', 'Havalandırma'],
        isActive: true,
      ),
    ];
  }

  static List<Reservation> getMockReservations() {
    final now = DateTime.now();

    return [
      Reservation(
        id: '1',
        userId: '1',
        resourceId: '1',
        resourceName: 'Toplantı Odası A',
        resourceType: ResourceType.meetingRoom,
        startsAt: now.add(const Duration(hours: 2)),
        endsAt: now.add(const Duration(hours: 4)),
        status: ReservationStatus.confirmed,
        notes: 'Proje toplantısı - Takım ile haftalık değerlendirme',
        createdAt: now.subtract(const Duration(hours: 1)),
      ),
      Reservation(
        id: '2',
        userId: '1',
        resourceId: '3',
        resourceName: 'Çalışma Masası 1',
        resourceType: ResourceType.desk,
        startsAt: now.add(const Duration(days: 1, hours: 9)),
        endsAt: now.add(const Duration(days: 1, hours: 17)),
        status: ReservationStatus.confirmed,
        notes: 'Konsantre çalışma - Rapor hazırlama',
        createdAt: now.subtract(const Duration(minutes: 30)),
      ),
      Reservation(
        id: '3',
        userId: '1',
        resourceId: '2',
        resourceName: 'Toplantı Odası B',
        resourceType: ResourceType.meetingRoom,
        startsAt: now.add(const Duration(days: 2, hours: 14)),
        endsAt: now.add(const Duration(days: 2, hours: 16)),
        status: ReservationStatus.pending,
        notes: 'Müşteri sunumu - Video konferans gerekli',
        createdAt: now.subtract(const Duration(minutes: 15)),
      ),
    ];
  }
}

// Reservation state management
class ReservationNotifier extends StateNotifier<List<Reservation>> {
  ReservationNotifier() : super(MockDataService.getMockReservations());

  // Kullanıcının rezervasyonlarını getir
  List<Reservation> getUserReservations(String userId) {
    return state.where((reservation) => reservation.userId == userId).toList();
  }

  // Belirli bir tarihteki rezervasyonları getir
  List<Reservation> getReservationsByDate(DateTime date) {
    return state.where((reservation) {
      final startDate = DateTime(
        reservation.startsAt.year,
        reservation.startsAt.month,
        reservation.startsAt.day,
      );
      final targetDate = DateTime(date.year, date.month, date.day);
      return startDate == targetDate;
    }).toList();
  }

  // Kaynak için rezervasyonları getir
  List<Reservation> getResourceReservations(String resourceId) {
    return state.where((reservation) => reservation.resourceId == resourceId).toList();
  }

  // Yeni rezervasyon ekle
  Future<bool> addReservation(Reservation reservation) async {
    // Çakışma kontrolü
    final conflicts = state.where((existing) =>
      existing.resourceId == reservation.resourceId &&
      existing.status != ReservationStatus.cancelled &&
      _hasTimeConflict(existing, reservation)
    ).toList();

    if (conflicts.isNotEmpty) {
      return false; // Çakışma var
    }

    // Simüle edilmiş API gecikmesi
    await Future.delayed(const Duration(seconds: 1));

    state = [...state, reservation];
    return true;
  }

  // Rezervasyon güncelle
  Future<bool> updateReservation(Reservation updatedReservation) async {
    // Çakışma kontrolü (kendi rezervasyonu hariç)
    final conflicts = state.where((existing) =>
      existing.id != updatedReservation.id &&
      existing.resourceId == updatedReservation.resourceId &&
      existing.status != ReservationStatus.cancelled &&
      _hasTimeConflict(existing, updatedReservation)
    ).toList();

    if (conflicts.isNotEmpty) {
      return false; // Çakışma var
    }

    await Future.delayed(const Duration(milliseconds: 500));

    state = state.map((reservation) =>
      reservation.id == updatedReservation.id ? updatedReservation : reservation
    ).toList();
    return true;
  }

  // Rezervasyon iptal et
  Future<void> cancelReservation(String reservationId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    state = state.map((reservation) =>
      reservation.id == reservationId
        ? reservation.copyWith(
            status: ReservationStatus.cancelled,
            updatedAt: DateTime.now(),
          )
        : reservation
    ).toList();
  }

  // Zaman çakışması kontrolü
  bool _hasTimeConflict(Reservation existing, Reservation newReservation) {
    return newReservation.startsAt.isBefore(existing.endsAt) &&
           newReservation.endsAt.isAfter(existing.startsAt);
  }
}

// Resources state management
class ResourceNotifier extends StateNotifier<List<Resource>> {
  ResourceNotifier() : super(MockDataService.getMockResources());

  // Tipe göre kaynakları filtrele
  List<Resource> getResourcesByType(ResourceType type) {
    return state.where((resource) => resource.type == type && resource.isActive).toList();
  }

  // Kapasiteye göre filtrele
  List<Resource> getResourcesByCapacity(int minCapacity) {
    return state.where((resource) => 
      (resource.capacity ?? 0) >= minCapacity && resource.isActive
    ).toList();
  }

  // ID'ye göre kaynak getir
  Resource? getResourceById(String id) {
    try {
      return state.firstWhere((resource) => resource.id == id);
    } catch (e) {
      return null;
    }
  }
}

// Providers
final reservationProvider = StateNotifierProvider<ReservationNotifier, List<Reservation>>((ref) {
  return ReservationNotifier();
});

final resourceProvider = StateNotifierProvider<ResourceNotifier, List<Resource>>((ref) {
  return ResourceNotifier();
});

// Convenience providers
final userReservationsProvider = Provider.family<List<Reservation>, String>((ref, userId) {
  final reservations = ref.watch(reservationProvider);
  return reservations.where((reservation) => reservation.userId == userId).toList();
});

final resourcesByTypeProvider = Provider.family<List<Resource>, ResourceType>((ref, type) {
  final resources = ref.watch(resourceProvider);
  return resources.where((resource) => resource.type == type && resource.isActive).toList();
});

final reservationsByDateProvider = Provider.family<List<Reservation>, DateTime>((ref, date) {
  final reservations = ref.watch(reservationProvider);
  return reservations.where((reservation) {
    final startDate = DateTime(
      reservation.startsAt.year,
      reservation.startsAt.month,
      reservation.startsAt.day,
    );
    final targetDate = DateTime(date.year, date.month, date.day);
    return startDate == targetDate;
  }).toList();
});