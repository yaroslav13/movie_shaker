import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/domain/entities/movies/movie.dart';
import 'package:movie_shaker/src/presentation/features/like_movie/movie_like_state_notifier.dart';
import 'package:ui_components/ui_components.dart';

final class MovieLikeButton extends HookConsumerWidget {
  const MovieLikeButton({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      movieLikeStateNotifierProvider(movie: movie),
    );

    useEffect(
      () {
        ref
            .read(movieLikeStateNotifierProvider(movie: movie).notifier)
            .onStart();
        return;
      },
      const [],
    );

    final isLiked = state.isLiked;

    return LikeButton(
      isLiked: isLiked,
      onChanged: (isLiked) => ref
          .read(movieLikeStateNotifierProvider(movie: movie).notifier)
          .onLikeStateChanged(isLiked: isLiked),
    );
  }
}
