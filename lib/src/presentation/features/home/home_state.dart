import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movies/movie.dart';
import 'package:ui_components/ui_components.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    required PaginationState<Movie> paginationState,
    Movie? suggestedMovie,
  }) = _HomeState;
}
