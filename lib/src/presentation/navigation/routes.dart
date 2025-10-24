import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_shaker/src/presentation/features/home/home_screen.dart';
import 'package:movie_shaker/src/presentation/features/movie_details/movie_details_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<MovieDetailsRoute>(path: 'movie/:id'),
  ],
)
final class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

final class MovieDetailsRoute extends GoRouteData with _$MovieDetailsRoute {
  const MovieDetailsRoute({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      MovieDetailsScreen(movieId: id);
}
