import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_shaker/src/domain/build_config/build_config.dart';

@immutable
final class AuthorizationInterceptor extends Interceptor {
  const AuthorizationInterceptor(this._buildConfig);

  final BuildConfig _buildConfig;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['api_key'] = _buildConfig.apiKey;
    super.onRequest(options, handler);
  }
}
