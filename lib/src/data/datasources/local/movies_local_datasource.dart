import 'package:movie_shaker/src/data/databases/daos/movie/movie_dao.dart';
import 'package:movie_shaker/src/data/databases/local_database.dart';

final class MoviesLocalDatasource {
  const MoviesLocalDatasource(this._dao);

  final MovieDao _dao;

  Future<MovieDbo> getMovie({required int id}) async {
    final movieDbo = await _dao.getMovie(id);

    return movieDbo;
  }

  Future<void> saveMovie({required MovieDbo movie}) async {
    await _dao.addMovie(movie);
  }
}
