import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/interceptors/metadata_interceptor.dart';
import 'package:movie_shaker/src/di/build_config/build_config_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'metadata_interceptor_provider.g.dart';

@riverpod
MetadataInterceptor metadataInterceptor(Ref ref) {
  final buildConfig = ref.watch(buildConfigProvider);

  return MetadataInterceptor(buildConfig);
}
