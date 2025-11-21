part of '../pull_to_refresh_widget.dart';

final class _MoviesPostersRefreshIndicator extends StatelessWidget {
  const _MoviesPostersRefreshIndicator();

  @override
  Widget build(BuildContext context) {
    return MsProgressIndicator.moviePosters();
  }
}
