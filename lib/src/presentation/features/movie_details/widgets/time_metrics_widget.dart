part of '../movie_details_screen.dart';

final class _TimeMetricsWidget extends StatelessWidget {
  const _TimeMetricsWidget({
    required this.runtime,
    required this.releaseDate,
  });

  final Duration runtime;
  final DateTime releaseDate;

  String _formatRuntime(BuildContext context, Duration runtime) {
    final l10n = context.localizations;
    final hours = runtime.inHours;
    final minutes = runtime.inMinutes.remainder(60);

    if (hours > 0 && minutes > 0) {
      return l10n.durationFormatHoursMinutes(hours, minutes);
    } else if (hours > 0) {
      return l10n.durationFormatHours(hours);
    } else {
      return l10n.durationFormatMinutes(minutes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MsText.titleMedium(context, context.localizations.time),
        SegmentedRow(
          segments: [
            SegmentData(
              icon: MsIcon.clock(),
              label: _formatRuntime(context, runtime),
              caption: context.localizations.runtime,
            ),
            SegmentData(
              icon: MsIcon.schedule(),
              label: releaseDate.year.toString(),
              caption: context.localizations.releaseYear,
            ),
          ],
        ),
      ],
    );
  }
}
