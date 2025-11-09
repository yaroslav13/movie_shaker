import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/datasources/local/movie_collection_entries_local_datasource.dart';
import 'package:movie_shaker/src/di/databases/movie_collection_entry_dao_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_collection_entries_local_datasource_provider.g.dart';

@riverpod
MovieCollectionEntriesLocalDatasource movieCollectionEntriesLocalDatasource(
  Ref ref,
) {
  final movieCollectionEntryDao = ref.watch(
    movieCollectionEntryDaoProvider,
  );

  return MovieCollectionEntriesLocalDatasource(movieCollectionEntryDao);
}
