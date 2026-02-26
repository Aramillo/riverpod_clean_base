import 'package:dio/dio.dart';
import 'package:riverpod_clean_base/core/config/env_config.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ${EnvConfig.tmdbAccessToken}';
    options.headers['accept'] = 'application/json';
    handler.next(options);
  }
}
