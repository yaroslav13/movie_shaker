import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/repositories/application_storage_repository_impl.dart';
import 'package:movie_shaker/src/di/databases/local_database_provider.dart';
import 'package:movie_shaker/src/domain/repositories/application_storage_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'application_storage_repository_provider.g.dart';

@riverpod
ApplicationStorageRepository applicationStorageRepository(Ref ref) {
  final db = ref.watch(localDatabaseProvider);

  return ApplicationStorageRepositoryImpl(db);
}
