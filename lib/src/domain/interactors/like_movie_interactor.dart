import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/repositories/movie_collections_repository.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';

final class LikeMovieInteractor implements Interactor<void, Movie> {
  const LikeMovieInteractor(
    this._moviesRepository,
    this._moviesCollectionsRepository,
  );

  final MoviesRepository _moviesRepository;
  final MovieCollectionsRepository _moviesCollectionsRepository;

  @override
  Future<void> call(Movie movie) async {
    const collection = MovieCollection.favorites;

    final doesFavoriteCollectionExist = await _moviesCollectionsRepository
        .doesCollectionExist(collection);

    if (!doesFavoriteCollectionExist) {
      await _moviesCollectionsRepository.addMovieCollection(collection);
    }

    await _moviesRepository.addMovieToCollection(movie, collection);
  }
}
