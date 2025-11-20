import 'dart:math';

import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movies_query/movies_query.dart';
import 'package:movie_shaker/src/domain/entities/pagination_page/pagination_page.dart';
import 'package:movie_shaker/src/domain/repositories/device_shake_notifications_repository.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';
import 'package:rxdart/rxdart.dart';

final class SubscribeMovieSuggestionsInteractor
    implements NoArgumentStreamInteractor<Movie> {
  const SubscribeMovieSuggestionsInteractor(
    this._deviceShakeNotificationsRepository,
    this._moviesRepository,
  );

  final DeviceShakeNotificationsRepository _deviceShakeNotificationsRepository;
  final MoviesRepository _moviesRepository;

  @override
  Stream<Movie> call() {
    return _deviceShakeNotificationsRepository.deviceShakeNotificationsStream
        .debounceTime(const Duration(seconds: 2))
        .asyncMap(
          (_) async {
            final movies = await _getRandomMoviesPage();

            return _chooseRandomMovie(movies);
          },
        );
  }

  Future<List<Movie>> _getRandomMoviesPage() async {
    final random = Random();
    final pageNumber = random.nextInt(PaginationPage.maxPageNumber);
    final moviesPage = await _moviesRepository.getMovies(
      MoviesQuery(pageNumber: pageNumber),
    );

    return moviesPage.items;
  }

  Movie _chooseRandomMovie(List<Movie> movies) {
    final random = Random();
    final index = random.nextInt(movies.length - 1);

    return movies[index];
  }
}
