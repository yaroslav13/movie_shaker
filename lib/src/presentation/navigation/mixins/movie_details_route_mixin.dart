import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_shaker/src/presentation/features/movie_details/movie_details_screen.dart';

base mixin MovieDetailsRouteMixin on GoRouteData {
  int get id;

  GoRouteData? get from;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      MovieDetailsScreen(movieId: id, openedFrom: from?.location);
}
