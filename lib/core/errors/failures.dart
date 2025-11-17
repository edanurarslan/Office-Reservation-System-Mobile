abstract class AppFailure {
  const AppFailure(this.message);
  final String message;
}

class NetworkFailure extends AppFailure {
  const NetworkFailure(super.message);
}

class AuthFailure extends AppFailure {
  const AuthFailure(super.message);
}

class ValidationFailure extends AppFailure {
  const ValidationFailure(super.message);
}

class StorageFailure extends AppFailure {
  const StorageFailure(super.message);
}

class ReservationFailure extends AppFailure {
  const ReservationFailure(super.message);
}

class QrCodeFailure extends AppFailure {
  const QrCodeFailure(super.message);
}

class PermissionFailure extends AppFailure {
  const PermissionFailure(super.message);
}

class UnknownFailure extends AppFailure {
  const UnknownFailure(super.message);
}