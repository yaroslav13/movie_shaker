part of 'app_exception.dart';

sealed class CacheException extends AppException {
  const CacheException();
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

final class UnknownCacheException extends CacheException {
  const UnknownCacheException();
}
