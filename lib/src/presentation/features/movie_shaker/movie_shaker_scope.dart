import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/presentation/features/movie_shaker/delegate/movie_shaker_delegate.dart';
import 'package:movie_shaker/src/presentation/features/movie_shaker/entities/movie_pool.dart';
import 'package:movie_shaker/src/presentation/features/movie_shaker/movie_shaker_state_notifier.dart';
import 'package:visibility_detector/visibility_detector.dart';

final class MovieShakerScope extends HookConsumerWidget {
  const MovieShakerScope({
    required this.scopeId,
    required this.delegate,
    required this.child,
    this.pool = const GlobalMoviePool(),
    super.key,
  });

  final String scopeId;
  final MovieShakerDelegate delegate;
  final MoviePool pool;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
      ..listen(
        movieShakerStateNotifierProvider(pool: pool).select(
          (state) => state.isShaking,
        ),
        (previous, current) {
          if (previous != current) {
            current
                ? delegate.onShakeDetected(context)
                : delegate.onShakeEnded(context);
          }
        },
      )
      ..listen(
        movieShakerStateNotifierProvider(pool: pool).select(
          (state) => state.suggestedMovie,
        ),
        (previous, current) {
          if (previous != current && current != null) {
            delegate.onMovieChosen(context, current);
          }
        },
      );

    final isViewportVisible = useState(false);
    final lifecycleState = useAppLifecycleState();

    final isScopeVisible =
        isViewportVisible.value && lifecycleState == AppLifecycleState.resumed;

    useEffect(
      () {
        ref
            .read(movieShakerStateNotifierProvider(pool: pool).notifier)
            .onVisibilityChanged(isVisible: isScopeVisible);

        return;
      },
      [pool, isScopeVisible],
    );

    final key = ValueKey('movie_shaker_scope_$scopeId');

    final onVisibilityChanged = (VisibilityInfo info) {
      if (key != info.key) {
        return;
      }

      isViewportVisible.value = info.isVisible;
    };

    return VisibilityDetector(
      key: key,
      onVisibilityChanged: onVisibilityChanged,

      child: child,
    );
  }
}

extension on VisibilityInfo {
  bool get isVisible => visibleFraction > 0;
}
