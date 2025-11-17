import '../entities/reservation.dart';
import '../entities/resource.dart';

abstract class ReservationRepository {
  Future<List<Reservation>> getAllReservations();
  Future<List<Reservation>> getUserReservations(String userId);
  Future<List<Resource>> getAllResources();
  Future<void> createReservation(Reservation reservation);
  Future<void> updateReservation(Reservation reservation);
  Future<void> deleteReservation(String reservationId);
  Future<bool> isTimeSlotAvailable(String resourceId, DateTime startTime, DateTime endTime, {String? excludeReservationId});
}