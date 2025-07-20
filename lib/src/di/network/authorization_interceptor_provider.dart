import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/interceptors/authorization_interceptor.dart';
import 'package:movie_shaker/src/di/build_config/build_config_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authorization_interceptor_provider.g.dart';

@riverpod
AuthorizationInterceptor authorizationInterceptor(Ref ref) {
  final buildConfig = ref.watch(buildConfigProvider);

  return AuthorizationInterceptor(buildConfig);
}
