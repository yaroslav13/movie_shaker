import 'dart:async';

import 'package:movie_shaker/src/di/interactors/apply_movie_filters_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/get_movie_filters_interactor_provider.dart';
import 'package:movie_shaker/src/domain/entities/imdb_rating/imdb_rating.dart';
import 'package:movie_shaker/src/domain/entities/movie_duration/movie_duration.dart';
import 'package:movie_shaker/src/domain/entities/movie_preferences/movie_preferences.dart';
import 'package:movie_shaker/src/domain/entities/release_years_range/release_years_range.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/presentation/features/advanced_movie_filters/advanced_movie_filters_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'advanced_movie_filters_state_notifier.g.dart';

@riverpod
class AdvancedMovieFiltersStateNotifier
    extends _$AdvancedMovieFiltersStateNotifier {
  @override
  AdvancedMovieFiltersState build() {
    return AdvancedMovieFiltersState(
      selectedImdbRating: ImdbRating.max(),
      selectedMovieDuration: MovieDuration.max(),
      selectedReleaseYears: ReleaseYearsRange.max(),
    );
  }

  void onStart() {
    unawaited(_fetchMoviePreferences());
  }

  void onImdbRatingRangeChanged(double value) {
    state = state.copyWith(
      selectedImdbRating: ImdbRating(value: value),
    );
  }

  void onMovieDurationRangeChanged(int values) {
    state = state.copyWith(
      selectedMovieDuration: MovieDuration(valueInMinutes: values),
    );
  }

  void onReleaseYearsRangeChanged(int start, int end) {
    state = state.copyWith(
      selectedReleaseYears: ReleaseYearsRange(
        from: start,
        to: end,
      ),
    );
  }

  void onApplyFiltersPressed() {
    unawaited(_applyFilters());
  }

  Future<void> _fetchMoviePreferences() async {
    try {
      final getMoviePreferencesInteractor = ref.read(
        getMovieFiltersInteractorProvider,
      );

      final moviePreferences = await getMoviePreferencesInteractor();

      state = state.copyWith(
        selectedImdbRating: moviePreferences.imdbRating,
        selectedMovieDuration: moviePreferences.movieDuration,
        selectedReleaseYears: moviePreferences.releaseYearsRange,
      );
    } on SemanticException {
      // ignore for now
    }
  }

  Future<void> _applyFilters() async {
    try {
      state = state.copyWith(isApplyingFilters: true);

      final applyMovieFiltersInteractor = ref.read(
        applyMovieFiltersInteractorProvider,
      );

      final moviePreferences = MoviePreferences(
        imdbRating: state.selectedImdbRating,
        movieDuration: state.selectedMovieDuration,
        releaseYearsRange: state.selectedReleaseYears,
      );

      await applyMovieFiltersInteractor(moviePreferences);
    } on Exception {
      // Handle any exceptions that occur during filter application
    } finally {
      state = state.copyWith(isApplyingFilters: false);
    }
  }
}
