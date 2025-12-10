import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui_components/ui_components.dart';

TwoDimensionalScrollableController useTwoDimensionalScrollableController() {
  return use(const _TwoDimensionalScrollableControllerHook());
}

final class _TwoDimensionalScrollableControllerHook
    extends Hook<TwoDimensionalScrollableController> {
  const _TwoDimensionalScrollableControllerHook();
  @override
  _TwoDimensionalScrollableControllerHookState createState() =>
      _TwoDimensionalScrollableControllerHookState();
}

final class _TwoDimensionalScrollableControllerHookState
    extends
        HookState<
          TwoDimensionalScrollableController,
          _TwoDimensionalScrollableControllerHook
        > {
  late TwoDimensionalScrollableController _controller;

  @override
  void initHook() {
    super.initHook();

    _controller = TwoDimensionalScrollableController();
  }

  @override
  TwoDimensionalScrollableController build(BuildContext context) => _controller;
}
