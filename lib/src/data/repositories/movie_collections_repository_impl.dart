import 'package:movie_shaker/src/data/datasources/local/collections_local_datasource.dart';
import 'package:movie_shaker/src/data/datasources/local/movie_collection_entries_local_datasource.dart';
import 'package:movie_shaker/src/data/mappers/dbo/movie_collection_dbo_mapper.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';
import 'package:movie_shaker/src/domain/exceptions/cache_exception.dart';
import 'package:movie_shaker/src/domain/repositories/movie_collections_repository.dart';

final class MovieCollectionsRepositoryImpl
    implements MovieCollectionsRepository {
  MovieCollectionsRepositoryImpl(
    this._collectionsLocalDatasource,
    this._collectionEntriesLocalDatasource,
    this._collectionDboMapper,
  );

  final CollectionsLocalDatasource _collectionsLocalDatasource;
  final MovieCollectionEntriesLocalDatasource _collectionEntriesLocalDatasource;

  final MovieCollectionDboMapper _collectionDboMapper;

  @override
  Future<void> addMovieCollection(MovieCollection collection) async {
    try {
      final collectionDbo = _collectionDboMapper.reverseMap(collection);

      if (collectionDbo == null) {
        throw const CacheWriteException();
      }

      await _collectionsLocalDatasource.saveMovieCollection(
        collection: collectionDbo,
      );
    } on CacheWriteException {
      rethrow;
    } on Exception catch (_, s) {
      Error.throwWithStackTrace(
        const CacheWriteException(),
        s,
      );
    }
  }

  @override
  Future<bool> doesCollectionExist(MovieCollection collection) async {
    try {
      final existingCollectionDbo = await _collectionsLocalDatasource
          .getMovieCollection(name: collection.name);

      return existingCollectionDbo != null;
    } on Exception catch (_, s) {
      Error.throwWithStackTrace(
        const CacheReadException(),
        s,
      );
    }
  }

  @override
  Future<List<MovieCollection>> getMovieCollections() async {
    try {
      final availableCollectionsDbos = await _collectionsLocalDatasource
          .getAllCollections();

      final collections = availableCollectionsDbos
          .map(_collectionDboMapper.map)
          .nonNulls
          .toList();

      return collections;
    } on Exception catch (_, s) {
      Error.throwWithStackTrace(
        const CacheReadException(),
        s,
      );
    }
  }

  @override
  Future<void> removeMovieCollection(MovieCollection collection) async {
    try {
      return await _collectionsLocalDatasource.removeMovieCollection(
        name: collection.name,
      );
    } on Exception catch (_, s) {
      Error.throwWithStackTrace(
        const CacheDeleteException(),
        s,
      );
    }
  }

  @override
  Future<bool> doesCollectionContainMovie(
    MovieCollection collection,
    int movieId,
  ) async {
    try {
      final movieCollectionEntries = await _collectionEntriesLocalDatasource
          .getMovieCollectionsEntries(collectionName: collection.name);

      return movieCollectionEntries.any((entry) => entry.movieId == movieId);
    } on Exception catch (_, s) {
      Error.throwWithStackTrace(
        const CacheReadException(),
        s,
      );
    }
  }
}
