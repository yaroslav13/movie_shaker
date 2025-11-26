import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_movie_collection_state.freezed.dart';

@freezed
sealed class AddMovieCollectionState with _$AddMovieCollectionState {
  const factory AddMovieCollectionState({
    @Default('') String collectionName,
  }) = _AddMovieCollectionState;
}
