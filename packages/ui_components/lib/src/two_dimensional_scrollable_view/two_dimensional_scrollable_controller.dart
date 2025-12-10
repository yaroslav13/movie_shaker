part of 'two_dimensional_scrollable_view.dart';

final class TwoDimensionalScrollableController {
  TwoDimensionalScrollableController();

  _TwoDimensionalScrollableViewState? _state;

  // ignore: use_setters_to_change_properties
  void _attach(_TwoDimensionalScrollableViewState state) {
    _state = state;
  }

  void _detach(_TwoDimensionalScrollableViewState state) {
    if (_state == state) {
      _state = null;
    }
  }

  Future<void> animateToIndex(
    int index, {
    Duration duration = MsAnimationDurations.medium,
    Curve curve = Curves.easeInOut,
  }) async {
    await _state?._scrollToIndex(
      index,
      duration: duration,
      curve: curve,
    );
  }
}
