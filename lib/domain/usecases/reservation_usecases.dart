import '../entities/reservation.dart';
import '../entities/resource.dart';
import '../repositories/reservation_repository.dart';

class GetAllReservationsUseCase {
  final ReservationRepository repository;

  GetAllReservationsUseCase(this.repository);

  Future<List<Reservation>> call() async {
    return await repository.getAllReservations();
  }
}

class GetUserReservationsUseCase {
  final ReservationRepository repository;

  GetUserReservationsUseCase(this.repository);

  Future<List<Reservation>> call(String userId) async {
    return await repository.getUserReservations(userId);
  }
}

class GetAllResourcesUseCase {
  final ReservationRepository repository;

  GetAllResourcesUseCase(this.repository);

  Future<List<Resource>> call() async {
    return await repository.getAllResources();
  }
}

class CreateReservationUseCase {
  final ReservationRepository repository;

  CreateReservationUseCase(this.repository);

  Future<void> call(Reservation reservation) async {
    // Önce zaman çakışması kontrolü yap
    final isAvailable = await repository.isTimeSlotAvailable(
      reservation.resourceId,
      reservation.startsAt,
      reservation.endsAt,
    );
    
    if (!isAvailable) {
      throw Exception('Bu zaman dilimi zaten rezerve edilmiş');
    }
    
    await repository.createReservation(reservation);
  }
}

class UpdateReservationUseCase {
  final ReservationRepository repository;

  UpdateReservationUseCase(this.repository);

  Future<void> call(Reservation reservation) async {
    // Güncelleme sırasında mevcut rezervasyonu hariç tut
    final isAvailable = await repository.isTimeSlotAvailable(
      reservation.resourceId,
      reservation.startsAt,
      reservation.endsAt,
      excludeReservationId: reservation.id,
    );
    
    if (!isAvailable) {
      throw Exception('Bu zaman dilimi zaten rezerve edilmiş');
    }
    
    await repository.updateReservation(reservation);
  }
}

class DeleteReservationUseCase {
  final ReservationRepository repository;

  DeleteReservationUseCase(this.repository);

  Future<void> call(String reservationId) async {
    await repository.deleteReservation(reservationId);
  }
}