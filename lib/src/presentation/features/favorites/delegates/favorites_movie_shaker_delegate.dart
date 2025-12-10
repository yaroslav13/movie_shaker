// ignore_for_file: no-empty-block

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/presentation/features/movie_shaker/delegate/movie_shaker_delegate.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';
import 'package:theme/theme.dart';

final class FavoritesMovieShakerDelegate implements MovieShakerDelegate {
  const FavoritesMovieShakerDelegate({
    required this.onScrollRequested,
  });

  final Future<void> Function(Duration, Movie) onScrollRequested;

  @override
  void onMovieChosen(BuildContext context, Movie movie) {
    _scrollToMovie(context, movie).whenComplete(
      () {
        if (!context.mounted) {
          return;
        }

        FavoriteMovieDetailsRoute(id: movie.id).go(context);
      },
    ).ignore();
  }

  @override
  void onShakeDetected(BuildContext context) {}

  @override
  void onShakeEnded(BuildContext context) {}

  Future<void> _scrollToMovie(BuildContext context, Movie movie) async {
    try {
      await onScrollRequested(MsAnimationDurations.long, movie);
    } on Exception catch (_, _) {
      // ignore
    } finally {
      await Future<void>.delayed(MsAnimationDurations.medium);
    }
  }
}
