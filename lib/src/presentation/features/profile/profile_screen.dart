import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';
import 'package:ui_components/ui_components.dart';

final class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MsListTile.simple(
              leading: MsIcon.outlinedDisk(),
              title: context.localizations.storage,
              onTap: () => const StorageUsageRoute().go(context),
            ),
          ],
        ),
      ),
    );
  }
}
