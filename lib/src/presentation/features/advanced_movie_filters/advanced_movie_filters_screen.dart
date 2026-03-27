import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localization/localization.dart';
import 'package:movie_shaker/src/presentation/features/advanced_movie_filters/advanced_movie_filters_state_notifier.dart';
import 'package:movie_shaker/src/presentation/navigation/extras/home_branch_route_extra.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

final class AdvancedMovieFiltersScreen extends HookConsumerWidget {
  const AdvancedMovieFiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        ref.read(advancedMovieFiltersStateNotifierProvider.notifier).onStart();
        return;
      },
      const [],
    );

    ref.listen(
      advancedMovieFiltersStateNotifierProvider,
      (previous, current) {
        if (true == previous?.isApplyingFilters &&
            current.isApplyingFilters == false) {
          const HomeRoute(HomeRouteExtra.filtersApplied()).go(context);
        }
      },
    );

    final state = ref.watch(advancedMovieFiltersStateNotifierProvider);

    return Scaffold(
      appBar: MsAppBar.titleText(title: context.localizations.filters),
      body: SafeArea(
        child: Padding(
          padding: MsEdgeInsets.contentLarge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                child: _FiltersForm(),
              ),
              const SizedBox(height: MsSpacings.medium),
              MsElevatedButton(
                onPressed: state.isApplyingFilters
                    ? null
                    : () => ref
                          .read(
                            advancedMovieFiltersStateNotifierProvider.notifier,
                          )
                          .onApplyFiltersPressed(),
                child: MsText(context.localizations.apply.toUpperCase()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _FiltersForm extends HookConsumerWidget {
  const _FiltersForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(advancedMovieFiltersStateNotifierProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          YearsSlider(
            startYear: state.selectedReleaseYears.from,
            endYear: state.selectedReleaseYears.to,
            minYear: state.minReleaseYear,
            maxYear: state.maxReleaseYear,
            onChanged: (start, end) => ref
                .read(advancedMovieFiltersStateNotifierProvider.notifier)
                .onReleaseYearsRangeChanged(start, end),
          ),
          const SizedBox(height: MsSpacings.medium),
          MovieDurationSlider(
            minutes: state.selectedMovieDuration.valueInMinutes,
            minMinutes: state.minMovieDurationInMinutes,
            maxMinutes: state.maxMovieDurationInMinutes,
            onChanged: (minutes) => ref
                .read(advancedMovieFiltersStateNotifierProvider.notifier)
                .onMovieDurationRangeChanged(minutes),
          ),
          const SizedBox(height: MsSpacings.extraLarge),
          ImdbRatingSlider(
            rating: state.selectedImdbRating.value,
            minRating: state.minImdbRatingValue,
            maxRating: state.maxImdbRatingValue,
            onChanged: (rating) => ref
                .read(advancedMovieFiltersStateNotifierProvider.notifier)
                .onImdbRatingRangeChanged(rating),
          ),
        ],
      ),
    );
  }
}
