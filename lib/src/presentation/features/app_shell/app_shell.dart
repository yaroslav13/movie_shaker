import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localization/localization.dart';
import 'package:movie_shaker/src/presentation/features/app_shell/entities/bottom_nav_tab.dart';
import 'package:ui_components/ui_components.dart';

final class AppShell extends StatelessWidget {
  const AppShell({required this.child, super.key});

  final Widget child;

  void _onTabSelected(BuildContext context, int index) {
    BottomNavTab.values[index].go(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Builder(
        builder: (context) {
          final currentLocation = GoRouterState.of(context).uri;
          final currentTab = BottomNavTab.values.byLocation(currentLocation);

          return MsBottomBar(
            items: BottomNavTab.values.map(
              (tab) {
                final localizations = context.localizations;

                final icon = switch (tab) {
                  BottomNavTab.home => MsIcon.home(),
                  BottomNavTab.collections => MsIcon.collections(),
                  BottomNavTab.favorites => MsIcon.favorite(),
                  BottomNavTab.profile => MsIcon.profile(),
                };

                final label = switch (tab) {
                  BottomNavTab.home => localizations.home,
                  BottomNavTab.collections => localizations.collections,
                  BottomNavTab.favorites => localizations.favorites,
                  BottomNavTab.profile => localizations.profile,
                };

                return MsBottomBarItem(label: label, icon: icon);
              },
            ).toList(),
            currentTabIndex: currentTab.index,
            onTabSelected: (index) => _onTabSelected(context, index),
          );
        },
      ),
    );
  }
}
