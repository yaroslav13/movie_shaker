import 'package:movie_shaker/src/domain/annotations/throws.dart';
import 'package:movie_shaker/src/domain/exceptions/application_storage_exception.dart';

abstract interface class ApplicationStorageRepository {
  @Throws([ApplicationStorageClearingException])
  Future<void> clear();

  @Throws([ApplicationStorageReadingException])
  Future<double> getSizeInGb();

  @Throws([ApplicationStorageReadingException])
  Future<bool> get isEmpty;
}
