part of '../routes.dart';

@TypedGoRoute<HomeRoute>(path: '/')
final class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}
