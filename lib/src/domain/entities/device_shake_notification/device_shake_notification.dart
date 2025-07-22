import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/device_shake_notification/axis.dart';

part 'device_shake_notification.freezed.dart';

@freezed
sealed class DeviceShakeNotification with _$DeviceShakeNotification {
  const factory DeviceShakeNotification({
    required Axis? axis,
    required DateTime timestamp,
  }) = _DeviceShakeNotification;
}
