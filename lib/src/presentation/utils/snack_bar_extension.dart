import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

extension SnackBarX on BuildContext {
  Future<SnackBarClosedReason> showErrorSnackBar(
    String message, {
    VoidCallback? onClosed,
    AnimationStyle? snackBarAnimationStyle,
  }) {
    final snackBar = MsSnackBar.error(
      this,
      message,
    );

    return _showSnackBar(
      snackBar,
      onClosed: onClosed,
      snackBarAnimationStyle: snackBarAnimationStyle,
    );
  }

  Future<SnackBarClosedReason> _showSnackBar(
    SnackBar snackBar, {
    VoidCallback? onClosed,
    AnimationStyle? snackBarAnimationStyle,
  }) async {
    final controller = ScaffoldMessenger.of(this).showSnackBar(
      snackBar,
      snackBarAnimationStyle: snackBarAnimationStyle,
    );

    return controller.closed.whenComplete(() {
      onClosed?.call();
    });
  }
}
