import 'package:drift/drift.dart';
import 'package:movie_shaker/src/data/databases/tables/collections.dart';
import 'package:movie_shaker/src/data/databases/tables/movies.dart';

@DataClassName('MovieCollectionEntryDbo')
class MovieCollectionEntries extends Table {
  IntColumn get movieId =>
      integer().named('movie_id').references(Movies, #apiId)();

  TextColumn get collectionName =>
      text().named('collection_name').references(Collections, #name)();

  @override
  Set<Column> get primaryKey => {movieId, collectionName};
}
