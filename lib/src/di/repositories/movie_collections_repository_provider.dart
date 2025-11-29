import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/repositories/movie_collections_repository_impl.dart';
import 'package:movie_shaker/src/di/datasources/collections_local_datasource_provider.dart';
import 'package:movie_shaker/src/di/datasources/movie_collection_entries_local_datasource_provider.dart';
import 'package:movie_shaker/src/di/mappers/movie_collection_dbo_mapper_provider.dart';
import 'package:movie_shaker/src/domain/repositories/movie_collections_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_collections_repository_provider.g.dart';

@riverpod
MovieCollectionsRepository movieCollectionsRepository(Ref ref) {
  final collectionsLocalDatasource = ref.watch(
    collectionsLocalDatasourceProvider,
  );

  final movieCollectionEntriesLocalDatasource = ref.watch(
    movieCollectionEntriesLocalDatasourceProvider,
  );

  final movieCollectionDboMapper = ref.watch(
    movieCollectionDboMapperProvider,
  );

  return MovieCollectionsRepositoryImpl(
    collectionsLocalDatasource,
    movieCollectionEntriesLocalDatasource,
    movieCollectionDboMapper,
  );
}
