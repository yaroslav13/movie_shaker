import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/datasources/movies_datasource.dart';
import 'package:movie_shaker/src/di/network/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_datasource_provider.g.dart';

@riverpod
MoviesDatasource moviesDatasource(Ref ref) {
  final dio = ref.watch(dioProvider);

  return MoviesDatasource(dio);
}
