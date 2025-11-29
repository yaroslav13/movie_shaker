import 'dart:ui';

import 'package:flutter_hooks/flutter_hooks.dart';

typedef ThrottledCallback = void Function(VoidCallback callback);

ThrottledCallback useThrottle(Duration duration) {
  final throttler = useMemoized(() => _Throttler(duration), [duration]);

  return throttler.run;
}

final class _Throttler {
  _Throttler(this.duration);

  final Duration duration;

  var _locked = false;

  Future<void> run(VoidCallback callback) async {
    if (!_locked) {
      _locked = true;
      callback();
      await Future<void>.delayed(duration);
      _locked = false;
    }
  }
}
