import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/mappers/dto/movie_preferences_dto_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_preferences_dto_mapper_provider.g.dart';

@riverpod
MoviePreferencesDtoMapper moviePreferencesDtoMapper(Ref ref) {
  return MoviePreferencesDtoMapper();
}
