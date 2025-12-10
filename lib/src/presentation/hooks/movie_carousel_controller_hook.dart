import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui_components/ui_components.dart';

MovieCarouselController useMovieCarouselController() {
  return use(const _MovieCarouselControllerHook());
}

final class _MovieCarouselControllerHook extends Hook<MovieCarouselController> {
  const _MovieCarouselControllerHook();

  @override
  _MovieCarouselControllerHookState createState() =>
      _MovieCarouselControllerHookState();
}

final class _MovieCarouselControllerHookState
    extends HookState<MovieCarouselController, _MovieCarouselControllerHook> {
  late MovieCarouselController _controller;

  @override
  void initHook() {
    super.initHook();

    _controller = MovieCarouselController();
  }

  @override
  MovieCarouselController build(BuildContext context) => _controller;
}
