import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/repositories/device_feedback_repository.dart';
import 'package:movie_shaker/src/domain/repositories/device_shake_notifications_repository.dart';
import 'package:rxdart/rxdart.dart';

const _resetTime = Duration(seconds: 2);

final class SubscribeDeviceShakingStateInteractor
    implements NoArgumentStreamInteractor<bool> {
  const SubscribeDeviceShakingStateInteractor(
    this._deviceShakeNotificationsRepository,
    this._deviceFeedbackRepository,
  );

  final DeviceShakeNotificationsRepository _deviceShakeNotificationsRepository;
  final DeviceFeedbackRepository _deviceFeedbackRepository;

  @override
  Stream<bool> call() {
    return _deviceShakeNotificationsRepository.deviceShakeNotificationsStream
        .switchMap(
          (_) {
            _deviceFeedbackRepository.vibrate().ignore();

            return Stream.value(true).concatWith(
              [
                Stream.value(false).delay(_resetTime),
              ],
            );
          },
        )
        .distinct();
  }
}
