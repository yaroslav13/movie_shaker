import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/mappers/dto/genre_dto_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'genre_dto_mapper_provider.g.dart';

@riverpod
GenreDtoMapper genreDtoMapper(Ref ref) {
  return const GenreDtoMapper();
}
