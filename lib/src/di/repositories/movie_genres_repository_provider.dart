import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/repositories/movie_genres_repository_impl.dart';
import 'package:movie_shaker/src/di/data_mappers/genre_dto_mapper_provider.dart';
import 'package:movie_shaker/src/di/datasources/movie_genres_remote_datasource_provider.dart';
import 'package:movie_shaker/src/domain/repositories/movie_genres_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_genres_repository_provider.g.dart';

@riverpod
MovieGenresRepository movieGenresRepository(Ref ref) {
  final remoteDatasource = ref.watch(movieGenresRemoteDatasourceProvider);
  final genreDtoMapper = ref.watch(genreDtoMapperProvider);

  return MovieGenresRepositoryImpl(
    remoteDatasource,
    genreDtoMapper,
  );
}
