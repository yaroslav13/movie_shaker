import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';

part 'movie_collection_picker_state.freezed.dart';

@freezed
sealed class MovieCollectionPickerState with _$MovieCollectionPickerState {
  const factory MovieCollectionPickerState.loading() =
      MovieCollectionPickerStateLoading;

  const factory MovieCollectionPickerState.data({
    required List<MovieCollection> allCollections,
    @Default([]) List<MovieCollection> selectedCollections,
  }) = MovieCollectionPickerStateData;

  const factory MovieCollectionPickerState.error({
    required SemanticException error,
  }) = MovieCollectionPickerStateError;
}
