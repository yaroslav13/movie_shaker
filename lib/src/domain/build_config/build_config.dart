import 'package:flutter/foundation.dart';
import 'package:movie_shaker/src/domain/build_config/build_type.dart';

const _apiKey = String.fromEnvironment('API_KEY');
const _appBuildType = String.fromEnvironment('BUILD_TYPE');

const _baseUrl = 'https://api.themoviedb.org/3';
const _baseImageUrl = 'https://image.tmdb.org/t/p';

@immutable
final class BuildConfig {
  factory BuildConfig() {
    final currentBuildType = BuildType.fromValue(_appBuildType);

    return switch (currentBuildType) {
      BuildType.dev => BuildConfig._dev(),
      BuildType.prod => BuildConfig._prod(),
    };
  }

  const BuildConfig._({
    required this.enableLogs,
    required this.apiKey,
    required this.baseUrl,
    required this.baseImageUrl,
  });

  factory BuildConfig._dev() {
    return const BuildConfig._(
      enableLogs: true,
      apiKey: _apiKey,
      baseUrl: _baseUrl,
      baseImageUrl: _baseImageUrl,
    );
  }

  factory BuildConfig._prod() {
    return const BuildConfig._(
      enableLogs: false,
      apiKey: _apiKey,
      baseUrl: _baseUrl,
      baseImageUrl: _baseImageUrl,
    );
  }

  final bool enableLogs;
  final String baseUrl;
  final String baseImageUrl;
  final String apiKey;
}
