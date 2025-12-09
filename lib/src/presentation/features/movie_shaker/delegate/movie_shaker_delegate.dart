import 'package:flutter/cupertino.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';

abstract interface class MovieShakerDelegate {
  void onShakeDetected(BuildContext context);

  void onMovieChosen(BuildContext context, Movie movie);
}
