import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/genre/genre.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:ui_components/ui_components.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    required PaginationState<Movie> paginationState,
    DateTime? lastMoviesUpdate,
    @Default('') String searchQuery,
    @Default(<Genre>[]) List<Genre> availableGenres,
    Genre? selectedGenre,
  }) = _HomeState;
}
