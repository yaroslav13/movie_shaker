import 'package:flutter/services.dart';
import 'package:movie_shaker/src/domain/exceptions/device_feedback_exception.dart';
import 'package:movie_shaker/src/domain/repositories/device_feedback_repository.dart';

final class DeviceFeedbackRepositoryImpl implements DeviceFeedbackRepository {
  const DeviceFeedbackRepositoryImpl();

  @override
  Future<void> vibrate() async {
    try {
      await HapticFeedback.heavyImpact();
    } on Exception catch (e, s) {
      Error.throwWithStackTrace(const DeviceFeedbackException(), s);
    }
  }
}
