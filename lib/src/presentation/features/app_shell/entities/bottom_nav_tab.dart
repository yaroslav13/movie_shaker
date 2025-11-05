import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';

enum BottomNavTab implements GoRouteData {
  home(HomeRoute()),
  collections(CollectionsRoute()),
  favorites(FavoritesRoute()),
  profile(ProfileRoute());

  const BottomNavTab(this.route);

  final GoRouteData route;

  @override
  String get location => route.location;

  @override
  void go(BuildContext context) => route.go(context);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return route.build(context, state);
  }

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return route.buildPage(context, state);
  }

  @override
  FutureOr<bool> onExit(BuildContext context, GoRouterState state) {
    return route.onExit(context, state);
  }

  @override
  Future<T?> push<T>(BuildContext context) {
    return route.push<T>(context);
  }

  @override
  void pushReplacement(BuildContext context) {
    route.pushReplacement(context);
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return route.redirect(context, state);
  }

  @override
  void replace(BuildContext context) {
    route.replace(context);
  }
}

extension BottomNavTabX on List<BottomNavTab> {
  BottomNavTab byLocation(Uri location) {
    return firstWhere(
      (tab) => location.path.startsWith(tab.location),
    );
  }
}
