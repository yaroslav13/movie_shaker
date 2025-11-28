import 'package:movie_shaker/src/domain/annotations/throws.dart';
import 'package:movie_shaker/src/domain/entities/genre/genre.dart';
import 'package:movie_shaker/src/domain/exceptions/network_exception.dart';

abstract interface class MovieGenresRepository {
  @Throws([NetworkException])
  Future<List<Genre>> getMovieGenres();
}
