import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localization/localization.dart';
import 'package:movie_shaker/src/presentation/features/movie_details/movie_details_state.dart';
import 'package:movie_shaker/src/presentation/features/movie_details/movie_details_state_notifier.dart';
import 'package:ui_components/ui_components.dart';

part 'widgets/overview_widget.dart';
part 'widgets/popularity_metrics_widget.dart';
part 'widgets/time_metrics_widget.dart';

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
        MovieDetailsStateError() => LoadingErrorStub(
          onRetry: () => ref
              .read(movieDetailsStateNotifierProvider.notifier)
              .onRetryPressed(movieId),
        ),
        MovieDetailsStateData(
          :final title,
          :final posterUrl,
          :final overview,
          :final voteAverage,
          :final voteCount,
          :final popularity,
          :final runtime,
          :final releaseDate,
        ) =>
          CustomScrollView(
            slivers: [
              MsFloatingAppBar(imageUrl: posterUrl),
              SliverPadding(
                padding: MsEdgeInsets.largeContent,
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      MsText.headlineMedium(context, title),
                      const SizedBox(height: MsSpacings.large),
                      _OverviewWidget(overview: overview),
                      const SizedBox(height: MsSpacings.large),
                      _PopularityMetricsWidget(
                        voteAverage: voteAverage,
                        voteCount: voteCount,
                        popularity: popularity,
                      ),
                      const SizedBox(height: MsSpacings.large),
                      _TimeMetricsWidget(
                        runtime: runtime,
                        releaseDate: releaseDate,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
      },
    );
  }
}
