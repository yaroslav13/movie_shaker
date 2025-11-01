part of '../movie_details_screen.dart';

final class _OverviewWidget extends StatelessWidget {
  const _OverviewWidget({required this.overview});

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: MsSpacings.xSmall,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MsText.titleMedium(context, context.localizations.overview),
        MsText.bodySmall(context, overview),
      ],
    );
  }
}
