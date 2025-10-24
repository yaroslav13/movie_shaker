import 'package:movie_shaker/src/data/entities/movie/movie_dto.dart';
import 'package:movie_shaker/src/data/extensions/object_x.dart';
import 'package:movie_shaker/src/domain/base/base_mappers.dart';
import 'package:movie_shaker/src/domain/build_config/build_config.dart';
import 'package:movie_shaker/src/domain/entities/movies/movie.dart';

final class MovieMapper with SafeMapper<MovieDto, Movie> {
  const MovieMapper(this._buildConfig);

  final BuildConfig _buildConfig;

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

    return Movie(
      id: id,
      title: title,
      originalTitle: originalTitle,
      posterUrl: '${_buildConfig.baseImageUrl}$posterPath',
    );
  }
}
