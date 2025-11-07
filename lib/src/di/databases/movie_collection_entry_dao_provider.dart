import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/databases/daos/movie_collection_entry/movie_collection_entry_dao.dart';
import 'package:movie_shaker/src/di/databases/local_database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_collection_entry_dao_provider.g.dart';

@riverpod
MovieCollectionEntryDao movieCollectionEntryDao(Ref ref) {
  final db = ref.watch(localDatabaseProvider);

  return MovieCollectionEntryDao(db);
}
