import 'package:movie_shaker/src/data/databases/daos/collection/collection_dao.dart';
import 'package:movie_shaker/src/data/databases/local_database.dart';

final class CollectionsLocalDatasource {
  const CollectionsLocalDatasource(this._dao);

  final CollectionDao _dao;

  Future<CollectionDbo?> getMovieCollection({required String name}) async {
    final collectionDbo = await _dao.getCollection(name);

    return collectionDbo;
  }

  Future<List<CollectionDbo>> getAllCollections() async {
    final availableCollections = await _dao.getAllCollections();

    return availableCollections;
  }

  Future<void> saveMovieCollection({required CollectionDbo collection}) async {
    return _dao.addCollection(collection);
  }

  Future<void> removeMovieCollection({required String name}) async {
    return _dao.deleteCollection(name);
  }
}
