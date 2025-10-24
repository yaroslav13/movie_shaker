import 'package:movie_shaker/src/data/entities/movie/movie_dto.dart';
import 'package:movie_shaker/src/domain/base/base_mappers.dart';
import 'package:movie_shaker/src/domain/build_config/build_config.dart';
import 'package:movie_shaker/src/domain/entities/movies/movie.dart';

final class MovieMapper implements BaseMapper<MovieDto, Movie> {
  MovieMapper(this._buildConfig);

  final BuildConfig _buildConfig;

  @override
  Movie map(MovieDto argument) {
    final posterPath = argument.posterPath;

    final posterUrl = posterPath != null
        ? '${_buildConfig.baseImageUrl}$posterPath'
        : null;

    return Movie(
      id: argument.id,
      title: argument.title,
      originalTitle: argument.originalTitle,
      posterUrl: posterUrl,
    );
  }
}
