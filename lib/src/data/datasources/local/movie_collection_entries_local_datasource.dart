import 'package:movie_shaker/src/data/databases/daos/movie_collection_entry/movie_collection_entry_dao.dart';
import 'package:movie_shaker/src/data/databases/local_database.dart';

final class MovieCollectionEntriesLocalDatasource {
  const MovieCollectionEntriesLocalDatasource(this._dao);

  final MovieCollectionEntryDao _dao;

  Future<List<MovieCollectionEntryDbo>> getMovieCollectionsEntries({
    required String collectionName,
  }) {
    final movieCollectionEntriesDbo = _dao
        .getMovieCollectionEntriesByCollection(collectionName);

    return movieCollectionEntriesDbo;
  }

  Future<void> saveMovieCollectionEntry({
    required String collectionName,
    required int movieId,
  }) {
    final movieCollectionEntryDbo = MovieCollectionEntryDbo(
      collectionName: collectionName,
      movieId: movieId,
    );

    return _dao.addMovieCollectionEntry(movieCollectionEntryDbo);
  }

  Future<void> deleteMovieCollectionEntry({
    required String collectionName,
    required int movieId,
  }) {
    final movieCollectionEntryDbo = MovieCollectionEntryDbo(
      collectionName: collectionName,
      movieId: movieId,
    );

    return _dao.deleteMovieCollectionEntry(movieCollectionEntryDbo);
  }
}
