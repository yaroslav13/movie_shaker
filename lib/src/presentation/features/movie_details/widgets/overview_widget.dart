part of '../movie_details_screen.dart';

final class _OverviewWidget extends StatelessWidget {
  const _OverviewWidget({
    required this.title,
    required this.overview,
  });

  final String title;
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: MsSpacings.regular,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MsText.headlineMedium(context, title),
        MsText.bodySmall(context, overview),
      ],
    );
  }
}
