import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';

part 'favorites_state.freezed.dart';

@freezed
sealed class FavoritesState with _$FavoritesState {
  const factory FavoritesState.data({
    @Default([]) List<Movie> favoriteMovies,
  }) = FavoritesStateData;

  const factory FavoritesState.loading() = FavoritesStateLoading;

  const factory FavoritesState.error(
    AppException exception,
  ) = FavoritesStateError;
}
