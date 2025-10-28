import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/device_shake_notifications_repository_provider.dart';
import 'package:movie_shaker/src/di/repositories/movies_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/subscribe_movie_suggestions_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subscribe_movie_suggestions_interactor_provider.g.dart';

@riverpod
SubscribeMovieSuggestionsInteractor subscribeMovieSuggestionsInteractor(
  Ref ref,
) {
  final deviceShakeNotificationsRepository = ref.watch(
    deviceShakeNotificationsRepositoryProvider,
  );

  final moviesRepository = ref.watch(
    moviesRepositoryProvider,
  );

  return SubscribeMovieSuggestionsInteractor(
    deviceShakeNotificationsRepository,
    moviesRepository,
  );
}
