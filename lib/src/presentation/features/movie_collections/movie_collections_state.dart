import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection_details/movie_collection_details.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/collection_modification_exception.dart';

part 'movie_collections_state.freezed.dart';

@freezed
sealed class MovieCollectionsState with _$MovieCollectionsState {
  const factory MovieCollectionsState.loading() = MovieCollectionsStateLoading;

  const factory MovieCollectionsState.data({
    @Default([]) List<MovieCollectionDetails> collections,
    CollectionModificationException? collectionChangeFailure,
  }) = MovieCollectionsStateData;

  const factory MovieCollectionsState.error(SemanticException error) =
      MovieCollectionsStateError;

  const MovieCollectionsState._();

  CollectionModificationException? get collectionChangeFailure {
    return switch (this) {
      MovieCollectionsStateData(:final collectionChangeFailure) =>
        collectionChangeFailure,
      _ => null,
    };
  }
}
