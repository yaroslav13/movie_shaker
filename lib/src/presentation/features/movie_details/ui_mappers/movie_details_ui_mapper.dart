import 'package:movie_shaker/src/domain/base/base_mappers.dart';
import 'package:movie_shaker/src/domain/entities/movie_details/movie_details.dart';
import 'package:movie_shaker/src/presentation/features/movie_details/movie_details_state.dart';

final class MovieDetailsUiMapper
    implements BaseBiMapper<MovieDetails, MovieDetailsStateData> {
  MovieDetailsUiMapper(this.movieId);

  final int movieId;

  @override
  MovieDetailsStateData map(covariant MovieDetails argument) {
    return MovieDetailsStateData(
      title: argument.title,
      overview: argument.overview,
      releaseDate: argument.releaseDate,
      posterUrl: argument.posterUrl,
      runtime: argument.runtime,
      voteAverage: argument.voteAverage,
      voteCount: argument.voteCount,
      genres: argument.genres,
      tagline: argument.tagline,
      homepageUrl: argument.homepageUrl,
      popularity: argument.popularity,
    );
  }

  @override
  MovieDetails reverseMap(covariant MovieDetailsStateData argument) {
    return MovieDetails(
      id: movieId,
      title: argument.title,
      overview: argument.overview,
      releaseDate: argument.releaseDate,
      posterUrl: argument.posterUrl,
      runtime: argument.runtime,
      voteAverage: argument.voteAverage,
      voteCount: argument.voteCount,
      genres: argument.genres,
      tagline: argument.tagline,
      homepageUrl: argument.homepageUrl,
      popularity: argument.popularity,
    );
  }
}
