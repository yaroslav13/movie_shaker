import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/presentation/features/movie_details/movie_details_state.dart';
import 'package:movie_shaker/src/presentation/features/movie_details/movie_details_state_notifier.dart';
import 'package:ui_components/ui_components.dart';

final class MovieDetailsScreen extends HookConsumerWidget {
  const MovieDetailsScreen({required this.movieId, super.key});

  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        ref.read(movieDetailsStateNotifierProvider.notifier).onStart(movieId);

        return;
      },
      const [],
    );
    final state = ref.watch(movieDetailsStateNotifierProvider);

    return Scaffold(
      body: switch (state) {
        MovieDetailsStateLoading() => const Center(
          child: GlassesProgressIndicator(),
        ),
        MovieDetailsStateError() => const LoadingErrorStub(),
        MovieDetailsStateData(:final title, :final posterUrl) =>
          CustomScrollView(
            slivers: [
              MsFloatingAppBar(
                title: title,
                imageUrl: posterUrl,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [],
                ),
              ),
            ],
          ),
      },
    );
  }
}
