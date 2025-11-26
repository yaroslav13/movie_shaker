part of '../paged_staggered_grid_view.dart';

final class _FooterTile extends StatelessWidget {
  const _FooterTile({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(
      vertical: MsEdgeInsets.contentSmall.vertical,
    ),
    child: Center(child: child),
  );
}
