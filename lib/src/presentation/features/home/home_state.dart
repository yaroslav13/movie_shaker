import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movies/movie.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default([]) List<Movie> movies,
    Movie? suggestedMovie,
  }) = _HomeState;
}
