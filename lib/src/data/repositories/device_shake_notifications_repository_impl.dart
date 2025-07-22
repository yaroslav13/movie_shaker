import 'dart:async';
import 'dart:math';

import 'package:movie_shaker/src/data/datasources/sensors/sensors_data_datasource.dart';
import 'package:movie_shaker/src/domain/entities/device_shake_notification/axis.dart';
import 'package:movie_shaker/src/domain/entities/device_shake_notification/device_shake_notification.dart';
import 'package:movie_shaker/src/domain/repositories/device_shake_notifications_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sensors_plus/sensors_plus.dart';

final class DeviceShakeNotificationsRepositoryImpl
    implements DeviceShakeNotificationsRepository {
  DeviceShakeNotificationsRepositoryImpl(this._sensorsDataDatasource);

  final SensorsDataDatasource _sensorsDataDatasource;

  @override
  Stream<DeviceShakeNotification> get deviceShakeNotificationsStream =>
      _sensorsDataDatasource.subscribeAccelerometer().transform(
        _ShakeDetectionTransformer(),
      );
}

final class _ShakeDetectionTransformer
    extends
        StreamTransformerBase<UserAccelerometerEvent, DeviceShakeNotification> {
  static const _shakeThresholdGravity = 2.7;
  static const _shakeSlopTimeMS = 500;
  static const _shakeCountResetTime = 3000;
  static const _minimumShakeCount = 1;

  int _shakeTimestamp = DateTime.now().millisecondsSinceEpoch;
  int _shakeCount = 0;

  @override
  Stream<DeviceShakeNotification> bind(Stream<UserAccelerometerEvent> stream) {
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

          final gX = x / 9.80665;
          final gY = y / 9.80665;
          final gZ = z / 9.80665;

          final gForce = sqrt(gX * gX + gY * gY + gZ * gZ);

          if (gForce > _shakeThresholdGravity) {
            final now = DateTime.now().millisecondsSinceEpoch;

            // ignore shake events too close to each other (500ms)
            if (_shakeTimestamp + _shakeSlopTimeMS > now) {
              return null;
            }

            // reset the shake count after 3 seconds of no shakes
            if (_shakeTimestamp + _shakeCountResetTime < now) {
              _shakeCount = 0;
            }

            _shakeTimestamp = now;
            _shakeCount++;

            if (_shakeCount >= _minimumShakeCount) {
              final absX = gX.abs();
              final absY = gY.abs();
              final absZ = gZ.abs();

              Axis? direction;

              if (absX > absY && absX > absZ) {
                direction = Axis.x;
              } else if (absY > absX && absY > absZ) {
                direction = Axis.y;
              } else if (absZ > absX && absZ > absY) {
                direction = Axis.z;
              }

              return DeviceShakeNotification(
                timestamp: DateTime.fromMillisecondsSinceEpoch(now),
                axis: direction,
              );
            }
          }
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
}
