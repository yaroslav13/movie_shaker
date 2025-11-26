import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

final class MsBottomSheetPage<T> extends Page<T> {
  const MsBottomSheetPage({
    required this.child,
    this.showDragHandle,
    this.useSafeArea,
    this.isScrollControlled,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.constraints,
    super.key,
  });

  final Widget child;
  final bool? showDragHandle;
  final bool? useSafeArea;
  final bool? isScrollControlled;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final BoxConstraints? constraints;

  @override
  Route<T> createRoute(BuildContext context) {
    final theme = Theme.of(context).extension<MsBottomSheetTheme>();

    final showDragHandle = this.showDragHandle ?? theme?.showDragHandle ?? true;
    final useSafeArea = this.useSafeArea ?? true;
    final isScrollControlled = this.isScrollControlled ?? true;
    final backgroundColor = this.backgroundColor ?? theme?.backgroundColor;
    final elevation = this.elevation ?? theme?.elevation;
    final shape = this.shape ?? theme?.shape;
    final clipBehavior = this.clipBehavior ?? theme?.clipBehavior;
    final constraints = this.constraints ?? theme?.constraints;

    return ModalBottomSheetRoute<T>(
      settings: this,
      isScrollControlled: isScrollControlled,
      showDragHandle: showDragHandle,
      useSafeArea: useSafeArea,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      constraints: constraints,
      builder: (context) => child,
    );
  }
}
