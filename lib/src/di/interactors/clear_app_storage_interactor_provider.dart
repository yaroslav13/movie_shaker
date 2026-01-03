import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/application_storage_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/clear_app_storage_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clear_app_storage_interactor_provider.g.dart';

@riverpod
ClearAppStorageInteractor clearAppStorageInteractor(Ref ref) {
  final applicationStorageRepository = ref.read(
    applicationStorageRepositoryProvider,
  );

  return ClearAppStorageInteractor(applicationStorageRepository);
}
