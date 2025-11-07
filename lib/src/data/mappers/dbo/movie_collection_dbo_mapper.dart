import 'package:movie_shaker/src/data/databases/local_database.dart';
import 'package:movie_shaker/src/domain/base/base_mappers.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';

final class MovieCollectionDboMapper
    implements BaseBiMapper<CollectionDbo, MovieCollection> {
  @override
  MovieCollection? map(CollectionDbo? instance) {
    if (instance == null) {
      return null;
    }

    if (instance.name == MovieCollection.favorites.name) {
      return MovieCollection.favorites;
    }

    return MovieCollection(name: instance.name);
  }

  @override
  CollectionDbo? reverseMap(MovieCollection? argument) {
    if (argument == null) {
      return null;
    }

    return CollectionDbo(
      name: argument.name,
      isDefault: argument == MovieCollection.favorites,
    );
  }
}
