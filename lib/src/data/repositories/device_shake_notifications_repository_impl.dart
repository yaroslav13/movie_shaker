import 'dart:async';
import 'dart:math';

import 'package:movie_shaker/src/data/datasources/remote/sensors_data_remote_datasource.dart';
import 'package:movie_shaker/src/domain/entities/device_shake_notification/axis.dart';
import 'package:movie_shaker/src/domain/entities/device_shake_notification/device_shake_notification.dart';
import 'package:movie_shaker/src/domain/entities/device_shake_timing/device_shake_timing.dart';
import 'package:movie_shaker/src/domain/repositories/device_shake_notifications_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sensors_plus/sensors_plus.dart';

final class DeviceShakeNotificationsRepositoryImpl
    implements DeviceShakeNotificationsRepository {
  DeviceShakeNotificationsRepositoryImpl(this._sensorsDataRemoteDatasource);

  final SensorsDataRemoteDatasource _sensorsDataRemoteDatasource;

  @override
  Stream<DeviceShakeNotification> get deviceShakeNotificationsStream =>
      _sensorsDataRemoteDatasource.subscribeAccelerometer().transform(
        _ShakeDetectionTransformer(),
      );
}

final class _ShakeDetectionTransformer
    extends StreamTransformerBase<AccelerometerEvent, DeviceShakeNotification> {
  static final _debounceTimeMS =
      DeviceShakeTiming.minShakeInterval.inMilliseconds;

  static const _gravity = 9.80665;

  static const _shakeThreshold = 0.2;

  int _lastShakeTimestamp = 0;

  @override
  Stream<DeviceShakeNotification> bind(Stream<AccelerometerEvent> stream) {
    StreamSubscription<DeviceShakeNotification?>? sourceSubscription;

    final outputController = StreamController<DeviceShakeNotification>(
      onResume: () => sourceSubscription?.resume(),
      onPause: () => sourceSubscription?.pause(),
      onCancel: () => sourceSubscription?.cancel(),
    );

    sourceSubscription = stream
        .mapNotNull((event) {
          final x = event.x;
          final y = event.y;
          final z = event.z;

          final gX = x / _gravity;
          final gY = y / _gravity;
          final gZ = z / _gravity;

          final gForce = sqrt(gX * gX + gY * gY + gZ * gZ);

          if (gForce > (1.0 + _shakeThreshold)) {
            final now = DateTime.now().millisecondsSinceEpoch;

            if (_lastShakeTimestamp + _debounceTimeMS > now) {
              return null;
            }

            _lastShakeTimestamp = now;

            return DeviceShakeNotification(
              timestamp: DateTime.fromMillisecondsSinceEpoch(now),
              axis: _determineAxis(gX.abs(), gY.abs(), gZ.abs()),
            );
          }

          return null;
        })
        .listen(
          outputController.add,
          onDone: outputController.close,
          onError: outputController.addError,
          cancelOnError: false,
        );

    return stream.isBroadcast
        ? outputController.stream.asBroadcastStream()
        : outputController.stream;
  }

  Axis? _determineAxis(double x, double y, double z) {
    if (x > y && x > z) {
      return Axis.x;
    }
    if (y > x && y > z) {
      return Axis.y;
    }
    if (z > x && z > y) {
      return Axis.z;
    }

    return null;
  }
}
