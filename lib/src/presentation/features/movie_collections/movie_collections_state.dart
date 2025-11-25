import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection_details/movie_collection_details.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';

part 'movie_collections_state.freezed.dart';

@freezed
sealed class MovieCollectionsState with _$MovieCollectionsState {
  const factory MovieCollectionsState.loading() = MovieCollectionsStateLoading;

  const factory MovieCollectionsState.data({
    @Default([]) List<MovieCollectionDetails> collections,
  }) = MovieCollectionsStateData;

  const factory MovieCollectionsState.error(AppException exception) =
      MovieCollectionsStateError;
}
