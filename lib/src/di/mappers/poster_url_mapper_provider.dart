import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/mappers/poster_url_mapper.dart';
import 'package:movie_shaker/src/di/build_config/build_config_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'poster_url_mapper_provider.g.dart';

@riverpod
PosterUrlMapper posterUrlMapper(Ref ref) {
  final buildConfig = ref.watch(buildConfigProvider);

  return PosterUrlMapper(buildConfig);
}
