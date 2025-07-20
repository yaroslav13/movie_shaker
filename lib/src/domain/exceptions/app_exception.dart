import 'package:flutter/foundation.dart';

part 'network_exception.dart';

@immutable
sealed class AppException implements Exception {
  const AppException([this.message]);

  final String? message;
}
