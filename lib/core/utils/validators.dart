/// Validation utilities
/// Parallel to .NET FluentValidation and DataAnnotations

import '../exceptions/app_exceptions.dart';

/// Result of validation
class ValidationResult {
  final bool isValid;
  final Map<String, List<String>> errors;

  ValidationResult({
    required this.isValid,
    this.errors = const {},
  });

  factory ValidationResult.success() => ValidationResult(isValid: true);

  factory ValidationResult.failure(Map<String, List<String>> errors) {
    return ValidationResult(isValid: false, errors: errors);
  }

  String get errorMessage {
    if (isValid) return '';
    final messages = <String>[];
    errors.forEach((field, fieldErrors) {
      messages.addAll(fieldErrors);
    });
    return messages.join('\n');
  }
}

/// Email validator
class EmailValidator {
  static const String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  static ValidationResult validate(String email) {
    if (email.isEmpty) {
      return ValidationResult.failure({
        'email': ['Email is required'],
      });
    }

    if (!RegExp(emailPattern).hasMatch(email)) {
      return ValidationResult.failure({
        'email': ['Invalid email format'],
      });
    }

    return ValidationResult.success();
  }
}

/// Password validator
class PasswordValidator {
  static ValidationResult validate(
    String password, {
    int minLength = 6,
    bool requireUppercase = false,
    bool requireNumbers = false,
    bool requireSpecialChars = false,
  }) {
    final errors = <String>[];

    if (password.isEmpty) {
      errors.add('Password is required');
    } else {
      if (password.length < minLength) {
        errors.add('Password must be at least $minLength characters');
      }
      if (requireUppercase && !password.contains(RegExp(r'[A-Z]'))) {
        errors.add('Password must contain uppercase letters');
      }
      if (requireNumbers && !password.contains(RegExp(r'[0-9]'))) {
        errors.add('Password must contain numbers');
      }
      if (requireSpecialChars &&
          !password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        errors.add('Password must contain special characters');
      }
    }

    if (errors.isEmpty) {
      return ValidationResult.success();
    }

    return ValidationResult.failure({'password': errors});
  }
}

/// String validator
class StringValidator {
  static ValidationResult validateRequired(String value, String fieldName) {
    if (value.trim().isEmpty) {
      return ValidationResult.failure({
        fieldName: ['$fieldName is required'],
      });
    }
    return ValidationResult.success();
  }

  static ValidationResult validateLength(
    String value,
    String fieldName, {
    int? minLength,
    int? maxLength,
  }) {
    if (value.isEmpty) {
      return ValidationResult.success();
    }

    final errors = <String>[];

    if (minLength != null && value.length < minLength) {
      errors.add('$fieldName must be at least $minLength characters');
    }

    if (maxLength != null && value.length > maxLength) {
      errors.add('$fieldName must not exceed $maxLength characters');
    }

    if (errors.isEmpty) {
      return ValidationResult.success();
    }

    return ValidationResult.failure({fieldName: errors});
  }
}

/// Numeric validator
class NumericValidator {
  static ValidationResult validateRange(
    num value,
    String fieldName, {
    required num min,
    required num max,
  }) {
    if (value < min || value > max) {
      return ValidationResult.failure({
        fieldName: ['$fieldName must be between $min and $max'],
      });
    }
    return ValidationResult.success();
  }

  static ValidationResult validatePositive(num value, String fieldName) {
    if (value <= 0) {
      return ValidationResult.failure({
        fieldName: ['$fieldName must be positive'],
      });
    }
    return ValidationResult.success();
  }
}

/// Date validator
class DateValidator {
  static ValidationResult validateNotPast(DateTime date, String fieldName) {
    if (date.isBefore(DateTime.now())) {
      return ValidationResult.failure({
        fieldName: ['$fieldName cannot be in the past'],
      });
    }
    return ValidationResult.success();
  }

  static ValidationResult validateNotFuture(DateTime date, String fieldName) {
    if (date.isAfter(DateTime.now())) {
      return ValidationResult.failure({
        fieldName: ['$fieldName cannot be in the future'],
      });
    }
    return ValidationResult.success();
  }

  static ValidationResult validateDateRange(
    DateTime startDate,
    DateTime endDate,
    String fieldName,
  ) {
    if (startDate.isAfter(endDate)) {
      return ValidationResult.failure({
        fieldName: ['Start date must be before end date'],
      });
    }
    return ValidationResult.success();
  }
}

/// Composite validator for combining multiple validations
class CompositeValidator {
  static ValidationResult validate(List<ValidationResult> results) {
    final allErrors = <String, List<String>>{};

    for (final result in results) {
      if (!result.isValid) {
        allErrors.addAll(result.errors);
      }
    }

    if (allErrors.isEmpty) {
      return ValidationResult.success();
    }

    return ValidationResult.failure(allErrors);
  }
}

/// Extension method for throwing ValidationException
extension ValidationResultExtension on ValidationResult {
  void throwIfInvalid() {
    if (!isValid) {
      throw ValidationException(
        message: errorMessage,
        errors: errors,
      );
    }
  }
}
