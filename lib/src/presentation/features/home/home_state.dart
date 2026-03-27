import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/genre/genre.dart';
import 'package:movie_shaker/src/domain/entities/imdb_rating/imdb_rating.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movie_duration/movie_duration.dart';
import 'package:movie_shaker/src/domain/entities/release_years_range/release_years_range.dart';
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
    MovieDuration? selectedMovieDuration,
    ImdbRating? selectedImdbRating,
    ReleaseYearsRange? selectedReleaseYearsRange,
  }) = _HomeState;
}
