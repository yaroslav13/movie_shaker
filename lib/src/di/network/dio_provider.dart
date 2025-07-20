import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/build_config/build_config_provider.dart';
import 'package:movie_shaker/src/di/network/dio_pretty_logger_provider.dart';
import 'package:movie_shaker/src/di/network/error_interceptor_provider.dart';
import 'package:movie_shaker/src/di/network/metadata_interceptor_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

const _connectTimeout = Duration(seconds: 5);
const _sendTimeout = Duration(seconds: 10);
const _receiveTimeout = Duration(seconds: 15);

const _baseUrl = 'http://www.omdbapi.com';

@riverpod
Dio dio(Ref ref) {
  final loggerInterceptor = ref.watch(prettyDioLoggerProvider);
  final buildConfig = ref.watch(buildConfigProvider);
  final metadataInterceptor = ref.watch(metadataInterceptorProvider);
  final errorInterceptor = ref.watch(errorInterceptorProvider);

  final interceptors = [
    if (buildConfig.enableLogs) loggerInterceptor,
    metadataInterceptor,
    errorInterceptor,
  ];

  final dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: _connectTimeout,
      sendTimeout: _sendTimeout,
      receiveTimeout: _receiveTimeout,
    ),
  )..interceptors.addAll(interceptors);

  return dio;
}
