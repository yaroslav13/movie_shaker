import 'package:drift/drift.dart';

@DataClassName('MovieDbo')
class Movies extends Table {
  IntColumn get apiId => integer().named('api_id')();

  TextColumn get title => text().named('title')();

  TextColumn get originalTitle => text().named('original_title')();

  TextColumn get posterUrl => text().named('poster_url')();

  TextColumn get genreIds => text().named('genre_ids').nullable()();

  @override
  Set<Column> get primaryKey => {apiId};
}
