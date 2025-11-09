import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/databases/daos/collection/collection_dao.dart';
import 'package:movie_shaker/src/di/databases/local_database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'collection_dao_provider.g.dart';

@riverpod
CollectionDao collectionDao(Ref ref) {
  final db = ref.watch(localDatabaseProvider);

  return CollectionDao(db);
}
