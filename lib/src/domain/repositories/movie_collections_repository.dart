import 'package:movie_shaker/src/domain/annotations/throws.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/exceptions/cache_exception.dart';

abstract interface class MovieCollectionsRepository {
  @Throws([CacheReadException])
  Future<List<MovieCollection>> getMovieCollections();

  @Throws([CacheWriteException])
  Future<void> addMovieCollection(MovieCollection collection);

  @Throws([CacheDeleteException])
  Future<void> removeMovieCollection(MovieCollection collection);

  @Throws([CacheReadException])
  Future<bool> doesCollectionExist(MovieCollection collection);
}
