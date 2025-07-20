import 'package:flutter/foundation.dart';

const _apiKey = String.fromEnvironment('API_KEY');

@immutable
final class BuildConfig {
  factory BuildConfig() {
    return BuildConfig._dev();
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
      baseUrl: 'https://api.themoviedb.org/3',
      baseImageUrl: 'https://image.tmdb.org/t/p/w500',
    );
  }

  final bool enableLogs;
  final String baseUrl;
  final String baseImageUrl;
  final String apiKey;
}
