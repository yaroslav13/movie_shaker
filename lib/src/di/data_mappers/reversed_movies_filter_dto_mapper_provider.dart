import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/mappers/dto/reversed_movies_filter_dto_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reversed_movies_filter_dto_mapper_provider.g.dart';

@riverpod
ReversedMoviesFilterMapper reversedMoviesFilterMapper(Ref ref) {
  return const ReversedMoviesFilterMapper();
}
