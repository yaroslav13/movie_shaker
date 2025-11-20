import 'package:movie_shaker/src/data/databases/local_database.dart';
import 'package:movie_shaker/src/domain/base/base_mappers.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';

final class MovieDboMapper implements BaseBiMapper<MovieDbo, Movie> {
  @override
  Movie? map(MovieDbo? instance) {
    if (instance == null) {
      return null;
    }

    final genreIds = instance.genreIds;

    return Movie(
      id: instance.apiId,
      title: instance.title,
      originalTitle: instance.originalTitle,
      posterUrl: instance.posterUrl,
      genreIds: genreIds.isNotEmpty
          ? genreIds.split(',').map(int.tryParse).whereType<int>().toList()
          : [],
    );
  }

  @override
  MovieDbo? reverseMap(Movie? argument) {
    if (argument == null) {
      return null;
    }

    return MovieDbo(
      apiId: argument.id,
      title: argument.title,
      originalTitle: argument.originalTitle,
      posterUrl: argument.posterUrl,
      genreIds: argument.genreIds.map((id) => id.toString()).join(','),
    );
  }
}
