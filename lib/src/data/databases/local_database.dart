import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:movie_shaker/src/data/databases/daos/collection/collection_dao.dart';
import 'package:movie_shaker/src/data/databases/daos/movie/movie_dao.dart';
import 'package:movie_shaker/src/data/databases/daos/movie_collection_entry/movie_collection_entry_dao.dart';
import 'package:movie_shaker/src/data/databases/tables/collections.dart';
import 'package:movie_shaker/src/data/databases/tables/movie_collection_entries.dart';
import 'package:movie_shaker/src/data/databases/tables/movies.dart';

part 'local_database.g.dart';

const _localDatabaseName = 'local_database.db';

@DriftDatabase(
  tables: [
    Movies,
    Collections,
    MovieCollectionEntries,
  ],
  daos: [
    MovieDao,
    CollectionDao,
    MovieCollectionEntryDao,
  ],
)
final class LocalDatabase extends _$LocalDatabase {
  LocalDatabase([QueryExecutor? executor])
    : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: _localDatabaseName);
  }
}
