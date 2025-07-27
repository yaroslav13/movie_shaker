part of 'pull_to_refresh_widget.dart';

final class _RefreshIndicator extends StatefulWidget {
  const _RefreshIndicator({this.state});

  final IndicatorState? state;

  @override
  State<_RefreshIndicator> createState() => _RefreshIndicatorState();
}

final class _RefreshIndicatorState extends State<_RefreshIndicator> {
  final _riveControllerCompleter = Completer<StateMachineController>();
  SMIBool? _popcornPoppingTrigger;
  Timer? _resetAnimationTimer;

  Future<void> _onRiveInit(Artboard artboard) async {
    try {
      final controller = StateMachineController.fromArtboard(
        artboard,
        artboard.stateMachines.single.name,
      );

      if (controller == null) {
        throw const NoStateMachineFoundException();
      }

      artboard.addController(controller);

      _configureRiveAnimationInputs(controller);

      _riveControllerCompleter.complete(controller);
    } on NoStateMachineFoundException catch (e, s) {
      _riveControllerCompleter.completeError(e, s);
    }
  }

  void _configureRiveAnimationInputs(StateMachineController controller) {
    _popcornPoppingTrigger =
        controller.findInput<bool>(
              const RefreshIndicatorRiveInputs.popcornPoppingTrigger(),
            )
            as SMIBool?;

    _handleIndicatorState(widget.state);
  }

  Future<void> _disposeRiveControllers() async {
    try {
      final controller = await _riveControllerCompleter.future;

      controller.dispose();

      _popcornPoppingTrigger = null;
    } on NoStateMachineFoundException {
      /// do nothing
    }
  }

  void _handleIndicatorState(IndicatorState? state) {
    final trigger = _popcornPoppingTrigger;
    if (trigger == null) {
      return;
    }

    switch (state) {
      case IndicatorState.settling:
        trigger.change(true);

        _resetAnimationTimer ??= Timer.periodic(
          _animationRepeatGap,
          (_) => trigger.change(!trigger.value),
        );
      case IndicatorState.loading:
        break;
      case _:
        trigger.change(false);

        _resetAnimationTimer?.cancel();
        _resetAnimationTimer = null;
    }
  }

  @override
  void didUpdateWidget(covariant _RefreshIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.state != oldWidget.state) {
      _handleIndicatorState(widget.state);
    }
  }

  @override
  void dispose() {
    unawaited(_disposeRiveControllers());

    _resetAnimationTimer?.cancel();
    _resetAnimationTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      MsAssets.animations.popcornAnimation,
      onInit: _onRiveInit,
    );
  }
}
