/// Exception classes for application-wide error handling
/// Parallel to .NET Exception hierarchy

abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;
  final StackTrace? stackTrace;

  AppException({
    required this.message,
    this.code,
    this.originalError,
    this.stackTrace,
  });

  @override
  String toString() => message;
}

/// Network/API related exceptions
class NetworkException extends AppException {
  NetworkException({
    required String message,
    String? code,
    dynamic originalError,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code ?? 'NETWORK_ERROR',
    originalError: originalError,
    stackTrace: stackTrace,
  );
}

/// Authentication/Authorization exceptions
class AuthException extends AppException {
  final int? statusCode;

  AuthException({
    required String message,
    String? code,
    this.statusCode,
    dynamic originalError,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code ?? 'AUTH_ERROR',
    originalError: originalError,
    stackTrace: stackTrace,
  );
}

/// Validation exceptions
class ValidationException extends AppException {
  final Map<String, List<String>>? errors;

  ValidationException({
    required String message,
    String? code,
    this.errors,
    dynamic originalError,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code ?? 'VALIDATION_ERROR',
    originalError: originalError,
    stackTrace: stackTrace,
  );
}

/// Server/API error exceptions
class ServerException extends AppException {
  final int? statusCode;
  final dynamic responseBody;

  ServerException({
    required String message,
    String? code,
    this.statusCode,
    this.responseBody,
    dynamic originalError,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code ?? 'SERVER_ERROR',
    originalError: originalError,
    stackTrace: stackTrace,
  );
}

/// Timeout exceptions
class TimeoutException extends AppException {
  TimeoutException({
    required String message,
    String? code,
    dynamic originalError,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code ?? 'TIMEOUT_ERROR',
    originalError: originalError,
    stackTrace: stackTrace,
  );
}

/// Database/Local storage exceptions
class StorageException extends AppException {
  StorageException({
    required String message,
    String? code,
    dynamic originalError,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code ?? 'STORAGE_ERROR',
    originalError: originalError,
    stackTrace: stackTrace,
  );
}

/// Not found exceptions
class NotFoundException extends AppException {
  NotFoundException({
    required String message,
    String? code,
    dynamic originalError,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code ?? 'NOT_FOUND',
    originalError: originalError,
    stackTrace: stackTrace,
  );
}

/// Conflict exceptions (409)
class ConflictException extends AppException {
  ConflictException({
    required String message,
    String? code,
    dynamic originalError,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code ?? 'CONFLICT',
    originalError: originalError,
    stackTrace: stackTrace,
  );
}

/// Unknown/Generic exceptions
class UnknownException extends AppException {
  UnknownException({
    required String message,
    String? code,
    dynamic originalError,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code ?? 'UNKNOWN_ERROR',
    originalError: originalError,
    stackTrace: stackTrace,
  );
}
