import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/interceptors/error_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'error_interceptor_provider.g.dart';

@riverpod
ErrorInterceptor errorInterceptor(Ref ref) {
  return ErrorInterceptor();
}
