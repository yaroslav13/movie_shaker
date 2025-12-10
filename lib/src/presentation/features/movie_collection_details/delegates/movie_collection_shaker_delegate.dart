// ignore_for_file: no-empty-block

import 'package:flutter/material.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/presentation/features/movie_shaker/delegate/movie_shaker_delegate.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';
import 'package:theme/theme.dart';

final class MovieCollectionShakerDelegate implements MovieShakerDelegate {
  const MovieCollectionShakerDelegate({
    required this.collectionName,
    required this.onScrollRequested,
  });

  final String collectionName;
  final Future<void> Function(Duration, Movie) onScrollRequested;

  @override
  void onMovieChosen(BuildContext context, Movie movie) {
    _scrollToMovie(context, movie).whenComplete(
      () {
        if (!context.mounted) {
          return;
        }

        CollectedMovieDetailsRoute(
          id: movie.id,
          collectionName: collectionName,
        ).go(context);
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
