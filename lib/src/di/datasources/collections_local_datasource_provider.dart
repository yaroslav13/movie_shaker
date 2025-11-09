import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/datasources/local/collections_local_datasource.dart';
import 'package:movie_shaker/src/di/databases/collection_dao_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'collections_local_datasource_provider.g.dart';

@riverpod
CollectionsLocalDatasource collectionsLocalDatasource(Ref ref) {
  final collectionDao = ref.watch(collectionDaoProvider);

  return CollectionsLocalDatasource(collectionDao);
}
