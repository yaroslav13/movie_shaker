import 'package:flutter/foundation.dart';
import 'package:movie_shaker/src/domain/exceptions/infrastructure_exception.dart';

part 'semantic_exception.dart';

@immutable
base class AppException implements Exception {
  const AppException([this.message]);

  final String? message;
}
