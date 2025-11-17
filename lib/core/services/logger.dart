/// Structured logging service
/// Parallel to .NET Serilog/NLog

import 'package:flutter/foundation.dart';
import '../config/app_config.dart';

enum LogLevel {
  debug,
  info,
  warning,
  error,
  critical,
}

/// Log entry
class LogEntry {
  final DateTime timestamp;
  final LogLevel level;
  final String message;
  final String? category;
  final dynamic error;
  final StackTrace? stackTrace;
  final Map<String, dynamic>? properties;

  LogEntry({
    required this.timestamp,
    required this.level,
    required this.message,
    this.category,
    this.error,
    this.stackTrace,
    this.properties,
  });

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('[${timestamp.toIso8601String()}] ');
    buffer.write('[${level.name.toUpperCase()}] ');
    if (category != null) buffer.write('[$category] ');
    buffer.write(message);

    if (error != null) {
      buffer.write('\nError: $error');
    }
    if (stackTrace != null && kDebugMode) {
      buffer.write('\n$stackTrace');
    }
    if (properties != null && properties!.isNotEmpty) {
      buffer.write('\nProperties: $properties');
    }

    return buffer.toString();
  }
}

/// Logger service
class Logger {
  static final Logger _instance = Logger._internal();

  factory Logger() {
    return _instance;
  }

  Logger._internal();

  final List<LogEntry> _logs = [];

  void debug(
    String message, {
    String? category,
    dynamic error,
    StackTrace? stackTrace,
    Map<String, dynamic>? properties,
  }) {
    _log(
      level: LogLevel.debug,
      message: message,
      category: category,
      error: error,
      stackTrace: stackTrace,
      properties: properties,
    );
  }

  void info(
    String message, {
    String? category,
    dynamic error,
    StackTrace? stackTrace,
    Map<String, dynamic>? properties,
  }) {
    _log(
      level: LogLevel.info,
      message: message,
      category: category,
      error: error,
      stackTrace: stackTrace,
      properties: properties,
    );
  }

  void warning(
    String message, {
    String? category,
    dynamic error,
    StackTrace? stackTrace,
    Map<String, dynamic>? properties,
  }) {
    _log(
      level: LogLevel.warning,
      message: message,
      category: category,
      error: error,
      stackTrace: stackTrace,
      properties: properties,
    );
  }

  void error(
    String message, {
    String? category,
    dynamic error,
    StackTrace? stackTrace,
    Map<String, dynamic>? properties,
  }) {
    _log(
      level: LogLevel.error,
      message: message,
      category: category,
      error: error,
      stackTrace: stackTrace,
      properties: properties,
    );
  }

  void critical(
    String message, {
    String? category,
    dynamic error,
    StackTrace? stackTrace,
    Map<String, dynamic>? properties,
  }) {
    _log(
      level: LogLevel.critical,
      message: message,
      category: category,
      error: error,
      stackTrace: stackTrace,
      properties: properties,
    );
  }

  void _log({
    required LogLevel level,
    required String message,
    String? category,
    dynamic error,
    StackTrace? stackTrace,
    Map<String, dynamic>? properties,
  }) {
    final entry = LogEntry(
      timestamp: DateTime.now(),
      level: level,
      message: message,
      category: category,
      error: error,
      stackTrace: stackTrace,
      properties: properties,
    );

    _logs.add(entry);

    if (LoggingConfig.logToConsole && kDebugMode) {
      debugPrint(entry.toString());
    }

    // TODO: Implement file logging
    // TODO: Implement remote logging
  }

  /// Get all logs
  List<LogEntry> getAllLogs() => List.unmodifiable(_logs);

  /// Get logs by level
  List<LogEntry> getLogsByLevel(LogLevel level) {
    return _logs.where((log) => log.level == level).toList();
  }

  /// Get logs by category
  List<LogEntry> getLogsByCategory(String category) {
    return _logs.where((log) => log.category == category).toList();
  }

  /// Clear all logs
  void clearLogs() => _logs.clear();

  /// Clear logs older than duration
  void clearOldLogs(Duration duration) {
    final cutoffTime = DateTime.now().subtract(duration);
    _logs.removeWhere((log) => log.timestamp.isBefore(cutoffTime));
  }

  /// Export logs as string
  String exportLogs() {
    return _logs.map((log) => log.toString()).join('\n\n');
  }

  /// Get log statistics
  Map<String, int> getStatistics() {
    final stats = <String, int>{};
    for (final log in _logs) {
      stats[log.level.name] = (stats[log.level.name] ?? 0) + 1;
    }
    return stats;
  }
}

/// Global logger instance
final logger = Logger();

/// Extension for easy logging in classes
extension LoggerExtension on Object {
  String get _className => runtimeType.toString();

  void logDebug(String message, {Map<String, dynamic>? properties}) {
    logger.debug(message, category: _className, properties: properties);
  }

  void logInfo(String message, {Map<String, dynamic>? properties}) {
    logger.info(message, category: _className, properties: properties);
  }

  void logWarning(String message, {Map<String, dynamic>? properties}) {
    logger.warning(message, category: _className, properties: properties);
  }

  void logError(
    String message, {
    dynamic error,
    StackTrace? stackTrace,
    Map<String, dynamic>? properties,
  }) {
    logger.error(
      message,
      category: _className,
      error: error,
      stackTrace: stackTrace,
      properties: properties,
    );
  }

  void logCritical(
    String message, {
    dynamic error,
    StackTrace? stackTrace,
    Map<String, dynamic>? properties,
  }) {
    logger.critical(
      message,
      category: _className,
      error: error,
      stackTrace: stackTrace,
      properties: properties,
    );
  }
}
