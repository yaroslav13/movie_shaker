import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/repositories/movies_repository_impl.dart';
import 'package:movie_shaker/src/di/datasources/movies_datasource_provider.dart';
import 'package:movie_shaker/src/di/mappers/movie_details_mapper_provider.dart';
import 'package:movie_shaker/src/di/mappers/movie_mapper_provider.dart';
import 'package:movie_shaker/src/domain/repositories/movies_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_repository_provider.g.dart';

@riverpod
MoviesRepository moviesRepository(Ref ref) {
  final moviesDatasource = ref.watch(moviesDatasourceProvider);
  final movieMapper = ref.watch(movieMapperProvider);
  final movieDetailsMapper = ref.watch(movieDetailsMapperProvider);

  return MoviesRepositoryImpl(
    moviesDatasource,
    movieMapper,
    movieDetailsMapper,
  );
}
