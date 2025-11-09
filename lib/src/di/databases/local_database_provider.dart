import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/databases/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_database_provider.g.dart';

@Riverpod(keepAlive: true)
LocalDatabase localDatabase(Ref ref) {
  final database = LocalDatabase();
  ref.onDispose(database.close);

  return database;
}
