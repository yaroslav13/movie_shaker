import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/mappers/movie_details_mapper.dart';
import 'package:movie_shaker/src/di/build_config/build_config_provider.dart';
import 'package:movie_shaker/src/di/mappers/genre_mapper_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_details_mapper_provider.g.dart';

@riverpod
MovieDetailsMapper movieDetailsMapper(Ref ref) {
  final genreMapper = ref.watch(genreMapperProvider);
  final buildConfig = ref.watch(buildConfigProvider);

  return MovieDetailsMapper(genreMapper, buildConfig);
}
