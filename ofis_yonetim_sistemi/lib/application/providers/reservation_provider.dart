import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/reservation.dart';
import '../../domain/entities/resource.dart';
import '../../domain/repositories/reservation_repository.dart';
import '../../infrastructure/providers/repository_providers.dart';

// Reservation state management
class ReservationNotifier extends StateNotifier<List<Reservation>> {
  final ReservationRepository _repository;

  ReservationNotifier(this._repository) : super([]) {
    _loadReservations();
  }

  // Load all reservations
  Future<void> _loadReservations() async {
    try {
      final reservations = await _repository.getAllReservations();
      state = reservations;
    } catch (e) {
      print('Error loading reservations: $e');
      state = [];
    }
  }

  // Refresh reservations
  Future<void> refreshReservations() async {
    await _loadReservations();
  }

  // Get user-specific reservations
  Future<List<Reservation>> getUserReservations(String userId) async {
    try {
      return await _repository.getUserReservations(userId);
    } catch (e) {
      print('Error getting user reservations: $e');
      return [];
    }
  }

  // Add new reservation
  Future<bool> addReservation(Reservation reservation) async {
    try {
      final isAvailable = await _repository.isTimeSlotAvailable(
        reservation.resourceId,
        reservation.startsAt,
        reservation.endsAt,
      );

      if (!isAvailable) {
        return false;
      }

      await _repository.createReservation(reservation);
      await _loadReservations();
      return true;
    } catch (e) {
      print('Error adding reservation: $e');
      return false;
    }
  }

  // Update reservation
  Future<bool> updateReservation(Reservation updatedReservation) async {
    try {
      final isAvailable = await _repository.isTimeSlotAvailable(
        updatedReservation.resourceId,
        updatedReservation.startsAt,
        updatedReservation.endsAt,
        excludeReservationId: updatedReservation.id,
      );

      if (!isAvailable) {
        return false;
      }

      await _repository.updateReservation(updatedReservation);
      await _loadReservations();
      return true;
    } catch (e) {
      print('Error updating reservation: $e');
      return false;
    }
  }

  // Cancel reservation
  Future<void> cancelReservation(String reservationId) async {
    try {
      final reservation = state.firstWhere((r) => r.id == reservationId);
      final updatedReservation = reservation.copyWith(
        status: ReservationStatus.cancelled,
        updatedAt: DateTime.now(),
      );
      await _repository.updateReservation(updatedReservation);
      await _loadReservations();
    } catch (e) {
      print('Error cancelling reservation: $e');
    }
  }

  // Delete reservation
  Future<void> deleteReservation(String reservationId) async {
    try {
      await _repository.deleteReservation(reservationId);
      await _loadReservations();
    } catch (e) {
      print('Error deleting reservation: $e');
    }
  }
}

// Resources state management
class ResourceNotifier extends StateNotifier<List<Resource>> {
  final ReservationRepository _repository;

  ResourceNotifier(this._repository) : super([]) {
    _loadResources();
  }

  Future<void> _loadResources() async {
    try {
      final resources = await _repository.getAllResources();
      state = resources;
    } catch (e) {
      print('Error loading resources: $e');
      state = [];
    }
  }

  Future<void> refreshResources() async {
    await _loadResources();
  }

  List<Resource> getResourcesByType(ResourceType type) {
    return state.where((resource) => resource.type == type && resource.isActive).toList();
  }

  List<Resource> getResourcesByCapacity(int minCapacity) {
    return state.where((resource) => 
      (resource.capacity ?? 0) >= minCapacity && resource.isActive
    ).toList();
  }

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
  final repository = ref.watch(reservationRepositoryProvider);
  return ReservationNotifier(repository);
});

final resourceProvider = StateNotifierProvider<ResourceNotifier, List<Resource>>((ref) {
  final repository = ref.watch(reservationRepositoryProvider);
  return ResourceNotifier(repository);
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
