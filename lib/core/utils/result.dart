/// Result<T> pattern for type-safe error handling
/// Parallel to .NET Result pattern (similar to OneOf library)

/// Generic Result type that can hold success or failure
sealed class Result<T> {
  const Result();

  /// Pattern matching for Result
  R when<R>({
    required R Function(T data) success,
    required R Function(Exception error) failure,
  }) {
    return switch (this) {
      Success(data: final data) => success(data),
      Failure(error: final error) => failure(error),
    };
  }

  /// Convert success value
  Result<U> map<U>(U Function(T) mapper) {
    return when(
      success: (data) => Success(mapper(data)),
      failure: (error) => Failure(error),
    );
  }

  /// Convert failure
  Result<T> mapError(Exception Function(Exception) mapper) {
    return when(
      success: (data) => Success(data),
      failure: (error) => Failure(mapper(error)),
    );
  }

  /// Flatten nested results
  Future<Result<U>> flatMapAsync<U>(
    Future<Result<U>> Function(T) mapper,
  ) async {
    return when(
      success: (data) => mapper(data),
      failure: (error) => Failure(error),
    );
  }

  /// Get value or default
  T? getOrNull() {
    return when(
      success: (data) => data,
      failure: (error) => null,
    );
  }

  /// Get error or null
  Exception? getErrorOrNull() {
    return when(
      success: (data) => null,
      failure: (error) => error,
    );
  }

  /// Check if success
  bool get isSuccess => this is Success;

  /// Check if failure
  bool get isFailure => this is Failure;
}

/// Success result
class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);

  @override
  String toString() => 'Success(data: $data)';
}

/// Failure result
class Failure<T> extends Result<T> {
  final Exception error;

  const Failure(this.error);

  @override
  String toString() => 'Failure(error: $error)';
}

/// Extension methods for easier Result creation
extension ResultExtension<T> on T {
  /// Convert value to Success
  Result<T> toSuccess() => Success(this);
}

/// Extension methods for async operations
extension FutureResultExtension<T> on Future<Result<T>> {
  /// Chain async results
  Future<Result<U>> andThen<U>(
    Future<Result<U>> Function(T) mapper,
  ) async {
    final result = await this;
    return result.when(
      success: (data) => mapper(data),
      failure: (error) => Failure(error),
    );
  }

  /// Handle error and continue
  Future<Result<T>> orElse(
    Future<Result<T>> Function(Exception) handler,
  ) async {
    final result = await this;
    return result.when(
      success: (data) => Success(data),
      failure: (error) => handler(error),
    );
  }
}
