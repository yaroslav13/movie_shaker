import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/repositories/device_feedback_repository_impl.dart';
import 'package:movie_shaker/src/domain/repositories/device_feedback_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_feedback_repository_provider.g.dart';

@riverpod
DeviceFeedbackRepository deviceFeedbackRepository(Ref ref) {
  return const DeviceFeedbackRepositoryImpl();
}
