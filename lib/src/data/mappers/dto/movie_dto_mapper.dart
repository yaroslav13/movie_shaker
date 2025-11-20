import 'package:movie_shaker/src/data/entities/movie/movie_dto.dart';
import 'package:movie_shaker/src/data/entities/poster/poster.dart';
import 'package:movie_shaker/src/data/extensions/object_x.dart';
import 'package:movie_shaker/src/data/mappers/poster_url_mapper.dart';
import 'package:movie_shaker/src/data/shared/image_resolutions.dart';
import 'package:movie_shaker/src/domain/base/base_mappers.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';

final class MovieDtoMapper with SafeMapper<MovieDto, Movie> {
  const MovieDtoMapper(this._posterUrlMapper);

  final PosterUrlMapper _posterUrlMapper;

  @override
  Movie mapSafe(MovieDto instance) {
    final id = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.id,
      'MovieDto.id',
    );

    final title = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.title,
      'MovieDto.title',
    );

    final originalTitle = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.originalTitle,
      'MovieDto.originalTitle',
    );

    final posterPath = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.posterPath,
      'MovieDto.posterPath',
    );

    final genreIds = instance.genreIds ?? <int>[];

    final posterUrl = _posterUrlMapper.mapSafe(
      Poster(
        resolution: ImageResolutions.original,
        posterPath: posterPath,
      ),
    );

    return Movie(
      id: id,
      title: title,
      originalTitle: originalTitle,
      posterUrl: posterUrl,
      genreIds: genreIds,
    );
  }
}
