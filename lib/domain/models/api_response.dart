/// API Hata Exception
class ApiException implements Exception {
  final int statusCode;
  final String message;
  final String? code;
  final Map<String, dynamic>? errors;
  final String? details;

  ApiException({
    required this.statusCode,
    required this.message,
    this.code,
    this.errors,
    this.details,
  });

  /// Hata mesajını formatla
  String get formattedMessage {
    if (code != null && code!.isNotEmpty) {
      return '$code: $message';
    }
    return message;
  }

  /// Detaylı hata açıklaması
  String get detailedMessage {
    final buffer = StringBuffer(formattedMessage);
    if (details != null && details!.isNotEmpty) {
      buffer.writeln('\nDetails: $details');
    }
    if (errors != null && errors!.isNotEmpty) {
      buffer.writeln('\nErrors:');
      errors!.forEach((key, value) {
        if (value is List) {
          buffer.writeln('  $key: ${value.join(", ")}');
        } else {
          buffer.writeln('  $key: $value');
        }
      });
    }
    return buffer.toString();
  }

  @override
  String toString() => detailedMessage;
}
