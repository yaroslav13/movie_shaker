import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/repositories/movies_repository_impl.dart';
import 'package:movie_shaker/src/di/datasources/movie_collection_entries_local_datasource_provider.dart';
import 'package:movie_shaker/src/di/datasources/movies_local_datasource_provider.dart';
import 'package:movie_shaker/src/di/datasources/movies_remote_datasource_provider.dart';
import 'package:movie_shaker/src/di/mappers/movie_dbo_mapper_provider.dart';
import 'package:movie_shaker/src/di/mappers/movie_details_dto_mapper_provider.dart';
import 'package:movie_shaker/src/di/mappers/movie_dto_mapper_provider.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_repository_provider.g.dart';

@riverpod
MoviesRepository moviesRepository(Ref ref) {
  final moviesRemoteDatasource = ref.watch(moviesRemoteDatasourceProvider);
  final moviesLocalDatasource = ref.watch(moviesLocalDatasourceProvider);
  final movieCollectionEntriesDatasource = ref.watch(
    movieCollectionEntriesLocalDatasourceProvider,
  );

  final movieDtoMapper = ref.watch(movieDtoMapperProvider);
  final movieDboMapper = ref.watch(movieDboMapperProvider);
  final movieDetailsDtoMapper = ref.watch(movieDetailsDtoMapperProvider);

  return MoviesRepositoryImpl(
    moviesRemoteDatasource,
    moviesLocalDatasource,
    movieCollectionEntriesDatasource,
    movieDtoMapper,
    movieDboMapper,
    movieDetailsDtoMapper,
  );
}
