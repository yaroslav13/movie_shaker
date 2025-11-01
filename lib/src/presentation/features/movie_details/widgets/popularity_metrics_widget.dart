part of '../movie_details_screen.dart';

final class _PopularityMetricsWidget extends StatelessWidget {
  const _PopularityMetricsWidget({
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
  });

  final double voteAverage;
  final int voteCount;
  final double popularity;

  String _formatPopularity(double popularity) {
    return popularity.toStringAsFixed(0);
  }

  String _formatVoteAverage(double voteAverage) {
    return voteAverage.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: MsSpacings.xSmall,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MsText.titleMedium(context, context.localizations.popularity),
        SegmentedRow(
          segments: [
            SegmentData(
              icon: MsIcon.star(),
              label: _formatVoteAverage(voteAverage),
              caption: '${context.localizations.rating} ($voteCount)',
            ),
            SegmentData(
              icon: MsIcon.trendingUp(),
              label: _formatPopularity(popularity),
              caption: context.localizations.popularity,
            ),
          ],
        ),
      ],
    );
  }
}
