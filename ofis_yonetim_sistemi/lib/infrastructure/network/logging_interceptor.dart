import 'package:dio/dio.dart';
import 'dart:developer' as developer;

/// Logging Interceptor - Logs all HTTP requests and responses for debugging
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    developer.log(
      '🚀 REQUEST [${options.method}] => ${options.uri}',
      name: 'HTTP',
    );
    developer.log(
      'Headers: ${options.headers}',
      name: 'HTTP',
    );
    if (options.data != null) {
      developer.log(
        'Body: ${options.data}',
        name: 'HTTP',
      );
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    developer.log(
      '✅ RESPONSE [${response.statusCode}] => ${response.requestOptions.uri}',
      name: 'HTTP',
    );
    developer.log(
      'Data: ${response.data}',
      name: 'HTTP',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    developer.log(
      '❌ ERROR [${err.response?.statusCode}] => ${err.requestOptions.uri}',
      name: 'HTTP',
      error: err.message,
    );
    developer.log(
      'Error Data: ${err.response?.data}',
      name: 'HTTP',
    );
    super.onError(err, handler);
  }
}
