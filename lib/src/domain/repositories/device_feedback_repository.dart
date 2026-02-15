import 'package:dart_code_metrics_annotations/annotations.dart';
import 'package:movie_shaker/src/domain/exceptions/device_feedback_exception.dart';

abstract interface class DeviceFeedbackRepository {
  @Throws({DeviceFeedbackException})
  Future<void> vibrate();
}
