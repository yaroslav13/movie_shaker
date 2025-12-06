import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localization/localization.dart';
import 'package:movie_shaker/src/domain/entities/genre/genre.dart';
import 'package:movie_shaker/src/presentation/features/movie_details/movie_details_state.dart';
import 'package:movie_shaker/src/presentation/features/movie_details/movie_details_state_notifier.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

part 'widgets/genres_overview_widget.dart';
part 'widgets/overview_widget.dart';
part 'widgets/popularity_metrics_widget.dart';
part 'widgets/rating_overview_widget.dart';
part 'widgets/release_time_details_widget.dart';

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
        MovieDetailsStateLoading() => Center(
          child: MsProgressIndicator.moviePosters(),
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
          :final runtime,
          :final releaseDate,
          :final homepageUrl,
          :final popularity,
          :final genres,
        ) =>
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              MsFloatingAppBar.backgroundImage(
                imageUrl: posterUrl,
                leading: RoundedBackButton(
                  onPressed: () => const HomeRoute().go(context),
                ),
                centerTitle: false,
                title: homepageUrl != null
                    ? WatchButton(
                        onPressed: () => ref
                            .read(movieDetailsStateNotifierProvider.notifier)
                            .onWatchButtonPressed(homepageUrl),
                      )
                    : null,
              ),
              SliverPadding(
                padding: MsEdgeInsets.scrollableContentPadding,
                sliver: SliverList.list(
                  children: [
                    Align(
                      child: _ReleaseTimeDetailsWidget(
                        releaseDate: releaseDate,
                        runtime: runtime,
                      ),
                    ),
                    const SizedBox(height: MsSpacings.extraLarge),
                    _OverviewWidget(
                      title: title,
                      overview: overview,
                    ),
                    const SizedBox(height: MsSpacings.extraLarge),
                    if (genres.isNotEmpty) ...[
                      _GenresOverviewWidget(genres: genres),
                      const SizedBox(height: MsSpacings.extraLarge),
                    ],
                    _RatingOverviewWidget(
                      voteAverage: voteAverage,
                      popularity: popularity,
                    ),
                    const SizedBox(height: MsSpacings.extraLarge),
                  ],
                ),
              ),
            ],
          ),
      },
    );
  }
}
