import 'package:movie_shaker/src/domain/exceptions/infrastructure_exception.dart';

base class ApplicationStorageException extends InfrastructureException {
  const ApplicationStorageException([super.message]);
}

final class ApplicationStorageReadingException
    extends ApplicationStorageException {
  const ApplicationStorageReadingException([super.message]);
}

final class ApplicationStorageClearingException
    extends ApplicationStorageException {
  const ApplicationStorageClearingException([super.message]);
}
