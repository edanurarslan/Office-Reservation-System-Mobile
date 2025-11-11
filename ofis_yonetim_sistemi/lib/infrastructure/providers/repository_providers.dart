import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/reservation_repository.dart';
import '../repositories/auth_repository_impl.dart';
import '../repositories/reservation_repository_impl.dart';
import '../datasources/auth_api_datasource.dart';
import '../datasources/reservation_api_datasource.dart';
import '../network/dio_client.dart';

/// Secure Storage Provider
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

/// Auth API Datasource Provider
final authApiDataSourceProvider = Provider<AuthApiDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthApiDataSource(dio);
});

/// Reservation API Datasource Provider
final reservationApiDataSourceProvider = Provider<ReservationApiDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return ReservationApiDataSource(dio);
});

/// Auth Repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final datasource = ref.watch(authApiDataSourceProvider);
  final storage = ref.watch(secureStorageProvider);
  return AuthRepositoryImpl(
    secureStorage: storage,
    apiDataSource: datasource,
  );
});

/// Reservation Repository Provider
final reservationRepositoryProvider = Provider<ReservationRepository>((ref) {
  final datasource = ref.watch(reservationApiDataSourceProvider);
  return ReservationRepositoryImpl(apiDataSource: datasource);
});
