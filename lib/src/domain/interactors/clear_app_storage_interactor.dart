import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/application_storage_exception.dart';
import 'package:movie_shaker/src/domain/repositories/application_storage_repository.dart';

final class ClearAppStorageInteractor implements NoArgumentInteractor<void> {
  const ClearAppStorageInteractor(
    this._applicationStorageRepository,
  );

  final ApplicationStorageRepository _applicationStorageRepository;

  @override
  Future<void> call() async {
    try {
      await _applicationStorageRepository.clear();
    } on ApplicationStorageException catch (e, s) {
      Error.throwWithStackTrace(
        SemanticException(e),
        s,
      );
    }
  }
}
