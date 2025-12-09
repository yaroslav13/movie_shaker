import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/device_feedback_repository_provider.dart';
import 'package:movie_shaker/src/di/repositories/device_shake_notifications_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/subscribe_device_shaking_state_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subscribe_device_shaking_state_interactor_provider.g.dart';

@riverpod
SubscribeDeviceShakingStateInteractor subscribeDeviceShakingStateInteractor(
  Ref ref,
) {
  final deviceShakeNotificationsRepository = ref.watch(
    deviceShakeNotificationsRepositoryProvider,
  );

  final deviceFeedbackRepository = ref.watch(
    deviceFeedbackRepositoryProvider,
  );

  return SubscribeDeviceShakingStateInteractor(
    deviceShakeNotificationsRepository,
    deviceFeedbackRepository,
  );
}
