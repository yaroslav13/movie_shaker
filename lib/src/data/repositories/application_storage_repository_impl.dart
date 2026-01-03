import 'dart:io';

import 'package:movie_shaker/src/data/databases/local_database.dart';
import 'package:movie_shaker/src/domain/exceptions/application_storage_exception.dart';
import 'package:movie_shaker/src/domain/repositories/application_storage_repository.dart';
import 'package:path_provider/path_provider.dart';

final class ApplicationStorageRepositoryImpl
    implements ApplicationStorageRepository {
  ApplicationStorageRepositoryImpl(this._localDatabase);

  final LocalDatabase _localDatabase;

  @override
  Future<void> clear() async {
    try {
      await _localDatabase.clearDatabase();
    } on Exception catch (_, s) {
      Error.throwWithStackTrace(
        const ApplicationStorageClearingException(),
        s,
      );
    }
  }

  @override
  Future<double> getSizeInGb() async {
    try {
      final dbFile = await _getDatabaseFile();

      if (dbFile.existsSync()) {
        final sizeInBytes = await dbFile.length();

        return sizeInBytes / (1024 * 1024 * 1024);
      }

      return 0.0;
    } on Exception catch (_, s) {
      Error.throwWithStackTrace(
        const ApplicationStorageReadingException(),
        s,
      );
    }
  }

  @override
  Future<bool> get isEmpty async {
    try {
      return await _localDatabase.isEmpty;
    } on Exception catch (_, s) {
      Error.throwWithStackTrace(
        const ApplicationStorageReadingException(),
        s,
      );
    }
  }

  Future<File> _getDatabaseFile() async {
    final dbDirectory = await getApplicationDocumentsDirectory();

    final dbPath = '${dbDirectory.path}/${LocalDatabase.databaseName}.sqlite';

    return File(dbPath);
  }
}
