import 'package:movie_shaker/src/data/entities/movie_details/movie_details_dto.dart';
import 'package:movie_shaker/src/data/extensions/object_x.dart';
import 'package:movie_shaker/src/data/mappers/genre_mapper.dart';
import 'package:movie_shaker/src/domain/base/base_mappers.dart';
import 'package:movie_shaker/src/domain/build_config/build_config.dart';
import 'package:movie_shaker/src/domain/entities/genre/genre.dart';
import 'package:movie_shaker/src/domain/entities/movie_details/movie_details.dart';

final class MovieDetailsMapper with SafeMapper<MovieDetailsDto, MovieDetails> {
  const MovieDetailsMapper(this._genreMapper, this._buildConfig);

  final GenreMapper _genreMapper;
  final BuildConfig _buildConfig;

  @override
  MovieDetails mapSafe(MovieDetailsDto instance) {
    final id = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.id,
      'MovieDetailsDto.id',
    );

    final title = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.title,
      'MovieDetailsDto.title',
    );

    final posterPath = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.posterPath,
      'MovieDetailsDto.posterPath',
    );

    final overview = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.overview,
      'MovieDetailsDto.overview',
    );

    final releaseDate = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.releaseDate,
      'MovieDetailsDto.releaseDate',
    );

    final voteAverage = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.voteAverage,
      'MovieDetailsDto.voteAverage',
    );

    final voteCount = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.voteCount,
      'MovieDetailsDto.voteCount',
    );

    final runtime = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.runtime,
      'MovieDetailsDto.runtime',
    );

    final popularity = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.popularity,
      'MovieDetailsDto.popularity',
    );

    return MovieDetails(
      id: id,
      title: title,
      overview: overview,
      voteAverage: voteAverage,
      genres:
          instance.genres?.map(_genreMapper.map).nonNulls.toList() ?? <Genre>[],
      posterUrl: '${_buildConfig.baseImageUrl}$posterPath',
      runtime: runtime,
      voteCount: voteCount,
      releaseDate: DateTime.parse(releaseDate),
      popularity: popularity,
      tagline: instance.tagline,
      homepageUrl: instance.homepage,
    );
  }
}
