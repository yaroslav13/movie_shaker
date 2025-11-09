import 'package:drift/drift.dart';
import 'package:movie_shaker/src/data/databases/local_database.dart';
import 'package:movie_shaker/src/data/databases/tables/collections.dart';

part 'collection_dao.g.dart';

@DriftAccessor(tables: [Collections])
class CollectionDao extends DatabaseAccessor<LocalDatabase>
    with _$CollectionDaoMixin {
  CollectionDao(super.db);

  Future<void> addCollection(CollectionDbo collection) async {
    await into(collections).insertOnConflictUpdate(collection);
  }

  Future<List<CollectionDbo>> getAllCollections() async {
    final query = select(collections);
    return query.get();
  }

  Future<CollectionDbo?> getCollection(String name) async {
    final query = select(collections)
      ..where((table) => table.name.equals(name));

    return query.getSingleOrNull();
  }

  Future<void> deleteCollection(String name) async {
    final query = delete(collections)
      ..where((table) => table.name.equals(name));

    await query.go();
  }
}
