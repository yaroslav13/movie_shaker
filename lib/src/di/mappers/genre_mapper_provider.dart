import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/mappers/genre_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'genre_mapper_provider.g.dart';

@riverpod
GenreMapper genreMapper(Ref ref) {
  return const GenreMapper();
}
