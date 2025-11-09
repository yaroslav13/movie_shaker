import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/datasources/local/movies_local_datasource.dart';
import 'package:movie_shaker/src/di/databases/movie_dao_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_local_datasource_provider.g.dart';

@riverpod
MoviesLocalDatasource moviesLocalDatasource(Ref ref) {
  final movieDao = ref.watch(movieDaoProvider);

  return MoviesLocalDatasource(movieDao);
}
