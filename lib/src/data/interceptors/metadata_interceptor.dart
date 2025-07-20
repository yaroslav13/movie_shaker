import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_shaker/src/domain/build_config/build_config.dart';

@immutable
final class MetadataInterceptor extends Interceptor {
  const MetadataInterceptor(this._buildConfig);

  final BuildConfig _buildConfig;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['apikey'] = _buildConfig.apiKey;
    super.onRequest(options, handler);
  }
}
