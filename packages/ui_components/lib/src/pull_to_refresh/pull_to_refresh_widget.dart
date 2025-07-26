import 'dart:async';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:ui_components/src/pull_to_refresh/exceptions/no_state_machine_found_exception.dart';
import 'package:ui_components/src/shared/assets.gen.dart';
import 'package:ui_components/src/shared/ms_edge_insets.dart';

part 'refresh_indicator.dart';
part 'rive/refresh_indicator_rive_inputs.dart';

const _refreshIndicatorDuration = RefreshIndicatorDurations(
  completeDuration: Duration(milliseconds: 500),
);

const _animationRepeatGap = Duration(seconds: 1);

final class PullToRefreshWidget extends StatelessWidget {
  const PullToRefreshWidget({
    required this.child,
    required this.onRefresh,
    super.key,
  });

  final Widget child;
  final AsyncCallback onRefresh;

  static const _indicatorHeight = 120.0;

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      offsetToArmed: _indicatorHeight,
      onRefresh: onRefresh,
      durations: _refreshIndicatorDuration,
      builder: (_, child, controller) {
        final indicatorHeight = _indicatorHeight * controller.value;

        return Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: indicatorHeight,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MsEdgeInsets.largeContent.bottom,
                ),
                child: _RefreshIndicator(state: controller.state),
              ),
            ),
            Transform.translate(
              offset: Offset(0, controller.value * indicatorHeight),
              child: IgnorePointer(
                ignoring: controller.state == IndicatorState.loading,
                child: child,
              ),
            ),
          ],
        );
      },
      child: child,
    );
  }
}
