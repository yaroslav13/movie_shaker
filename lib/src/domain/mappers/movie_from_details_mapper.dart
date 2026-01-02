import 'package:movie_shaker/src/domain/base/base_mappers.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movie_details/movie_details.dart';

final class MovieFromDetailsMapper implements BaseMapper<MovieDetails, Movie> {
  const MovieFromDetailsMapper();

  @override
  Movie map(covariant MovieDetails input) {
    return Movie(
      id: input.id,
      title: input.title,
      posterUrl: input.posterUrl,
      originalTitle: input.title,
      genreIds: input.genres.map((genre) => genre.id).toList(),
    );
  }
}
