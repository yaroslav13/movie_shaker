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

    return MoviesFilterDto(
      genres: argument.genres?.map((genre) => genre.id).join(','),
    );
  }
}
