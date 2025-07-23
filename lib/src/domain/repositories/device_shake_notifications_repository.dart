import 'package:movie_shaker/src/domain/entities/device_shake_notification/device_shake_notification.dart';

abstract interface class DeviceShakeNotificationsRepository {
  Stream<DeviceShakeNotification> get deviceShakeNotificationsStream;
}
