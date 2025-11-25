import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_shaker/src/presentation/features/app_shell/app_shell.dart';
import 'package:movie_shaker/src/presentation/features/favorites/favorites_screen.dart';
import 'package:movie_shaker/src/presentation/features/home/home_screen.dart';
import 'package:movie_shaker/src/presentation/features/movie_collections/movie_collections_screen.dart';
import 'package:movie_shaker/src/presentation/features/movie_details/movie_details_screen.dart';

part 'routes.g.dart';

final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@TypedShellRoute<AppShellRoute>(
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<HomeRoute>(
      path: '/home',
      routes: [
        TypedGoRoute<MovieDetailsRoute>(path: 'movie/:id'),
      ],
    ),
    TypedGoRoute<CollectionsRoute>(path: '/collections'),
    TypedGoRoute<FavoritesRoute>(path: '/favorites'),
    TypedGoRoute<ProfileRoute>(path: '/profile'),
  ],
)
final class AppShellRoute extends ShellRouteData {
  const AppShellRoute();

  static final $parentNavigatorKey = rootNavigatorKey;
  static final $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return AppShell(child: navigator);
  }
}

final class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

final class CollectionsRoute extends GoRouteData with _$CollectionsRoute {
  const CollectionsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MovieCollectionsScreen();
}

final class FavoritesRoute extends GoRouteData with _$FavoritesRoute {
  const FavoritesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const FavoritesScreen();
}

final class ProfileRoute extends GoRouteData with _$ProfileRoute {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Placeholder();
}

final class MovieDetailsRoute extends GoRouteData with _$MovieDetailsRoute {
  const MovieDetailsRoute({required this.id});

  static final $parentNavigatorKey = rootNavigatorKey;

  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      MovieDetailsScreen(movieId: id);
}
