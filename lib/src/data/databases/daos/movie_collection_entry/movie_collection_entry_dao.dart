import 'package:drift/drift.dart';
import 'package:movie_shaker/src/data/databases/local_database.dart';
import 'package:movie_shaker/src/data/databases/tables/movie_collection_entries.dart';

part 'movie_collection_entry_dao.g.dart';

@DriftAccessor(tables: [MovieCollectionEntries])
class MovieCollectionEntryDao extends DatabaseAccessor<LocalDatabase>
    with _$MovieCollectionEntryDaoMixin {
  MovieCollectionEntryDao(super.db);

  Future<void> addMovieCollectionEntry(
    MovieCollectionEntryDbo movieCollectionEntry,
  ) async {
    await into(
      movieCollectionEntries,
    ).insertOnConflictUpdate(movieCollectionEntry);
  }

  Future<List<MovieCollectionEntryDbo>> getMovieCollectionEntriesByCollection(
    String collectionName,
  ) async {
    final query = select(movieCollectionEntries)
      ..where((table) => table.collectionName.equals(collectionName));

    return query.get();
  }

  Future<List<MovieCollectionEntryDbo>> getMovieCollectionEntriesByMovie(
    int movieId,
  ) async {
    final query = select(movieCollectionEntries)
      ..where((table) => table.movieId.equals(movieId));

    return query.get();
  }

  Future<void> deleteMovieCollectionEntry(
    MovieCollectionEntryDbo movieCollectionEntry,
  ) async {
    final MovieCollectionEntryDbo(:movieId, :collectionName) =
        movieCollectionEntry;

    final query = delete(movieCollectionEntries)
      ..where((table) => table.movieId.equals(movieId))
      ..where((table) => table.collectionName.equals(collectionName));

    await query.go();
  }
}
