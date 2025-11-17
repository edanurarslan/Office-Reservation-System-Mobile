import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/reservation_repository.dart';
import '../repositories/auth_repository_impl.dart';
import '../repositories/reservation_repository_impl.dart';
import '../network/api_service.dart';

/// Secure Storage Provider
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

/// Auth Repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  final storage = ref.watch(secureStorageProvider);
  return AuthRepositoryImpl(
    secureStorage: storage,
    apiService: apiService,
  );
});

/// Reservation Repository Provider
final reservationRepositoryProvider = Provider<ReservationRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return ReservationRepositoryImpl(apiService: apiService);
});
