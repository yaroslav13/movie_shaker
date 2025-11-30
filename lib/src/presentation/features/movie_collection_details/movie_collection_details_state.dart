import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';

part 'movie_collection_details_state.freezed.dart';

@freezed
sealed class MovieCollectionDetailsState with _$MovieCollectionDetailsState {
  const factory MovieCollectionDetailsState.loading() =
      MovieCollectionDetailsStateLoading;

  const factory MovieCollectionDetailsState.data({
    required List<Movie> movies,
  }) = MovieCollectionDetailsStateData;

  const factory MovieCollectionDetailsState.error(
    SemanticException error,
  ) = MovieCollectionDetailsStateError;
}
