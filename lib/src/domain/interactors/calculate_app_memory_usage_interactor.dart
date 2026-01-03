import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/storage_usage_data/storage_usage_data.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/application_storage_exception.dart';
import 'package:movie_shaker/src/domain/repositories/application_storage_repository.dart';

final class CalculateAppMemoryUsageInteractor
    implements NoArgumentInteractor<StorageUsageData> {
  const CalculateAppMemoryUsageInteractor(
    this._applicationStorageRepository,
  );

  final ApplicationStorageRepository _applicationStorageRepository;

  @override
  Future<StorageUsageData> call() async {
    try {
      final storageSize = await _applicationStorageRepository.getSizeInGb();
      final isStorageEmpty = await _applicationStorageRepository.isEmpty;

      return StorageUsageData(
        usedInGB: storageSize,
        isEmpty: isStorageEmpty,
      );
    } on ApplicationStorageException catch (e, s) {
      Error.throwWithStackTrace(
        SemanticException(e),
        s,
      );
    }
  }
}
