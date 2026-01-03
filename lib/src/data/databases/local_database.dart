import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:movie_shaker/src/data/databases/daos/collection/collection_dao.dart';
import 'package:movie_shaker/src/data/databases/daos/movie/movie_dao.dart';
import 'package:movie_shaker/src/data/databases/daos/movie_collection_entry/movie_collection_entry_dao.dart';
import 'package:movie_shaker/src/data/databases/tables/collections.dart';
import 'package:movie_shaker/src/data/databases/tables/movie_collection_entries.dart';
import 'package:movie_shaker/src/data/databases/tables/movies.dart';

part 'local_database.g.dart';

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

  static const databaseName = 'local_database.db';

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: databaseName,
      native: DriftNativeOptions(
        setup: (db) {
          db.execute('PRAGMA auto_vacuum = FULL;');
        },
      ),
    );
  }

  Future<void> clearDatabase() async {
    await transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }

  Future<bool> get isEmpty async {
    for (final table in allTables) {
      final rowCount = await table.count().getSingle();
      if (rowCount > 0) {
        return false;
      }
    }

    return true;
  }
}
