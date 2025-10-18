class AppExceptions implements Exception {
  const AppExceptions(this.message);
  final String message;

  @override
  String toString() => 'AppException: $message';
}

class ServerException extends AppExceptions {
  const ServerException(super.message);
}

class NetworkException extends AppExceptions {
  const NetworkException(super.message);
}

class AuthException extends AppExceptions {
  const AuthException(super.message);
}

class ValidationException extends AppExceptions {
  const ValidationException(super.message);
}

class StorageException extends AppExceptions {
  const StorageException(super.message);
}

class PermissionException extends AppExceptions {
  const PermissionException(super.message);
}