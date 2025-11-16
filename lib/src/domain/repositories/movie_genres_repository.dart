import 'package:movie_shaker/src/domain/entities/genre/genre.dart';

abstract interface class MovieGenresRepository {
  Future<List<Genre>> getMovieGenres();
}
