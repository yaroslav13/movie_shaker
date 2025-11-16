import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/datasources/remote/movie_genres_remote_datasource.dart';
import 'package:movie_shaker/src/di/network/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_genres_remote_datasource_provider.g.dart';

@riverpod
MovieGenresRemoteDatasource movieGenresRemoteDatasource(Ref ref) {
  final dio = ref.watch(dioProvider);

  return MovieGenresRemoteDatasource(dio);
}
