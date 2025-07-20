import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/mappers/movie_mapper.dart';
import 'package:movie_shaker/src/di/build_config/build_config_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_mapper_provider.g.dart';

@riverpod
MovieMapper movieMapper(Ref ref) {
  final buildConfig = ref.watch(buildConfigProvider);

  return MovieMapper(buildConfig);
}
