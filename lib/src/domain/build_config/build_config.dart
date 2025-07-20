import 'package:flutter/foundation.dart';

const _apiKey = String.fromEnvironment('apiKey');

@immutable
final class BuildConfig {
  factory BuildConfig() {
    return BuildConfig._dev();
  }

  const BuildConfig._({
    required this.enableLogs,
    required this.apiKey,
  });

  factory BuildConfig._dev() {
    return const BuildConfig._(
      enableLogs: true,
      apiKey: _apiKey,
    );
  }

  final bool enableLogs;
  final String apiKey;
}
