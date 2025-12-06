part of '../movie_details_screen.dart';

final class _RatingOverviewWidget extends StatelessWidget {
  const _RatingOverviewWidget({
    required this.voteAverage,
    required this.popularity,
  });

  final double voteAverage;
  final double popularity;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        spacing: MsSpacings.medium,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: RatingCard(
              value: voteAverage,
              description: context.localizations.imdb.toUpperCase(),
            ),
          ),
          Expanded(
            child: PopularityScoreCard(
              score: popularity,
              description: context.localizations.trending.toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }
}
