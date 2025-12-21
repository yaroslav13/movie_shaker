import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/presentation/features/like_movie/movie_like_state_notifier.dart';
import 'package:ui_components/ui_components.dart';

final class MovieLikeButton extends HookConsumerWidget {
  const MovieLikeButton({
    required this.movie,
    this.onLikeStateChanged,
    this.padding,
    super.key,
  });

  final EdgeInsetsGeometry? padding;

  final Movie movie;
  final ValueChanged<bool>? onLikeStateChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      movieLikeStateNotifierProvider(movie: movie),
      (previous, current) {
        if (previous != null && previous.isLiked != current.isLiked) {
          onLikeStateChanged?.call(current.isLiked);
        }
      },
    );

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
      [movie],
    );

    final isLiked = state.isLiked;

    return LikeButton(
      isLiked: isLiked,
      padding: padding,
      onChanged: (isLiked) => ref
          .read(movieLikeStateNotifierProvider(movie: movie).notifier)
          .onLikeStateChanged(isLiked: isLiked),
    );
  }
}
