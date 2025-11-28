import 'package:movie_shaker/src/domain/exceptions/infrastructure_exception.dart';

sealed class CacheException extends InfrastructureException {
  const CacheException([super.message]);
}

final class BrokenCacheContentException extends CacheException {
  const BrokenCacheContentException();
}

final class CacheWriteException extends CacheException {
  const CacheWriteException();
}

final class CacheReadException extends CacheException {
  const CacheReadException();
}

final class CacheDeleteException extends CacheException {
  const CacheDeleteException();
}

final class CacheEntryNotFoundException extends CacheException {
  const CacheEntryNotFoundException();
}
