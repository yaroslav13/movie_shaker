import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/mappers/dto/movie_details_dto_mapper.dart';
import 'package:movie_shaker/src/di/mappers/genre_dto_mapper_provider.dart';
import 'package:movie_shaker/src/di/mappers/remote_image_url_mapper_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_details_dto_mapper_provider.g.dart';

@riverpod
MovieDetailsDtoMapper movieDetailsDtoMapper(Ref ref) {
  final genreDtoMapper = ref.watch(genreDtoMapperProvider);
  final remoteImageUrlMapper = ref.watch(remoteImageUrlMapperProvider);

  return MovieDetailsDtoMapper(genreDtoMapper, remoteImageUrlMapper);
}
