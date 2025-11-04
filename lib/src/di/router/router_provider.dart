import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/presentation/features/app_shell/entities/bottom_nav_tab.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: BottomNavTab.home.location,
    routes: $appRoutes,
    navigatorKey: rootNavigatorKey,
  );
}
