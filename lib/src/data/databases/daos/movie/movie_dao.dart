import 'package:drift/drift.dart';
import 'package:movie_shaker/src/data/databases/local_database.dart';
import 'package:movie_shaker/src/data/databases/tables/movies.dart';

part 'movie_dao.g.dart';

@DriftAccessor(tables: [Movies])
class MovieDao extends DatabaseAccessor<LocalDatabase> with _$MovieDaoMixin {
  MovieDao(super.db);

  Future<void> addMovie(MovieDbo movie) async {
    await into(movies).insertOnConflictUpdate(movie);
  }

  Future<List<MovieDbo>> getAllMovies() async {
    final query = select(movies);
    return query.get();
  }

  Future<MovieDbo> getMovie(int apiId) async {
    final query = select(movies)..where((table) => table.apiId.equals(apiId));

    return query.getSingle();
  }

  Future<void> deleteMovie(int apiId) async {
    final query = delete(movies)..where((table) => table.apiId.equals(apiId));

    await query.go();
  }
}
