import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/databases/daos/movie/movie_dao.dart';
import 'package:movie_shaker/src/di/databases/local_database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_dao_provider.g.dart';

@riverpod
MovieDao movieDao(Ref ref) {
  final db = ref.watch(localDatabaseProvider);

  return MovieDao(db);
}
