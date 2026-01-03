import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/application_storage_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/calculate_app_memory_usage_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calculate_app_memory_usage_interactor_provider.g.dart';

@riverpod
CalculateAppMemoryUsageInteractor calculateAppMemoryUsageInteractor(
  Ref ref,
) {
  final applicationStorageRepository = ref.read(
    applicationStorageRepositoryProvider,
  );

  return CalculateAppMemoryUsageInteractor(applicationStorageRepository);
}
