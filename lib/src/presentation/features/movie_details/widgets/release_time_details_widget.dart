part of '../movie_details_screen.dart';

final class _ReleaseTimeDetailsWidget extends StatelessWidget {
  const _ReleaseTimeDetailsWidget({
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
    return DotSeparatedText(
      fragments: [
        releaseDate.year.toString(),
        _formatRuntime(context, runtime),
      ],
    );
  }
}
