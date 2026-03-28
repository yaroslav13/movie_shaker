import 'package:movie_shaker/src/data/entities/movies_filter/movies_filter_dto.dart';
import 'package:movie_shaker/src/domain/base/base_mappers.dart';
import 'package:movie_shaker/src/domain/entities/movies_filter/movies_filter.dart';

final class ReversedMoviesFilterMapper
    implements BaseMapper<MoviesFilter, MoviesFilterDto> {
  const ReversedMoviesFilterMapper();

  @override
  MoviesFilterDto? map(MoviesFilter? argument) {
    if (argument == null) {
      return null;
    }

    final releaseYearsRange = argument.releaseYearsRange;
    final genres = argument.genres;

    return MoviesFilterDto(
      genres: genres.isEmpty
          ? null
          : argument.genres.map((genre) => genre.id).join(','),
      maxMovieDurationInMinutes: argument.movieDuration?.valueInMinutes,
      minImdbRating: argument.imdbRating?.value,
      minReleaseDate: releaseYearsRange != null
          ? DateTime(releaseYearsRange.from).toString()
          : null,
      maxReleaseDate: releaseYearsRange != null
          ? DateTime(releaseYearsRange.to).toString()
          : null,
    );
  }
}
