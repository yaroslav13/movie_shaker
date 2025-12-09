import 'package:flutter/material.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/presentation/features/movie_shaker/delegate/movie_shaker_delegate.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';

final class HomeMovieShakerDelegate implements MovieShakerDelegate {
  const HomeMovieShakerDelegate({
    required this.onShakeStateChanged,
  });

  final ValueChanged<bool> onShakeStateChanged;

  @override
  void onMovieChosen(BuildContext context, Movie movie) {
    MovieDetailsRoute(id: movie.id).go(context);
  }

  @override
  void onShakeDetected(BuildContext context) {
    onShakeStateChanged(true);
  }

  @override
  void onShakeEnded(BuildContext context) {
    onShakeStateChanged(false);
  }
}
