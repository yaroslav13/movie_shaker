import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection_entry/movie_collection_entry.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/infrastructure_exception.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';

final class RemoveMovieFromCollectionInteractor
    implements Interactor<void, MovieCollectionEntry> {
  const RemoveMovieFromCollectionInteractor(
    this._moviesRepository,
  );

  final MoviesRepository _moviesRepository;

  @override
  Future<void> call(MovieCollectionEntry param) async {
    try {
      await _moviesRepository.removeMovieFromCollection(
        param.movie,
        param.collection,
      );
    } on InfrastructureException catch (e, s) {
      Error.throwWithStackTrace(SemanticException(e), s);
    }
  }
}
