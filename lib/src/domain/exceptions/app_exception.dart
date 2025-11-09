import 'package:flutter/foundation.dart';

part 'cache_exception.dart';
part 'movie_details_not_found_exception.dart';
part 'network_exception.dart';

@immutable
sealed class AppException implements Exception {
  const AppException([this.message]);

  final String? message;
}
