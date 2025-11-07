import 'package:movie_shaker/src/data/entities/genre/genre_dto.dart';
import 'package:movie_shaker/src/data/extensions/object_x.dart';
import 'package:movie_shaker/src/domain/base/base_mappers.dart';
import 'package:movie_shaker/src/domain/entities/genre/genre.dart';

final class GenreDtoMapper with SafeMapper<GenreDto, Genre> {
  const GenreDtoMapper();

  @override
  Genre mapSafe(GenreDto instance) {
    final id = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.id,
      'GenreDto.id',
    );

    final name = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.name,
      'GenreDto.name',
    );

    return Genre(
      id: id,
      name: name,
    );
  }
}
