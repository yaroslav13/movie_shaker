import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';

part 'movie_collection_details.freezed.dart';

@freezed
sealed class MovieCollectionDetails with _$MovieCollectionDetails {
  const factory MovieCollectionDetails({
    required String name,
    @Default([]) List<Movie> movies,
  }) = _MovieCollectionDetails;

  const MovieCollectionDetails._();

  int get moviesCount => movies.length;
}
