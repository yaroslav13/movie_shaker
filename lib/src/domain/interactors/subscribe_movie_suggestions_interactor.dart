import 'dart:math';

import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/movies/movie.dart';
import 'package:movie_shaker/src/domain/repositories/device_shake_notifications_repository.dart';

// TODO(yhalivets): Make a custom request to the API to get a random movie
final class SubscribeMovieSuggestionsInteractor
    implements StreamInteractor<Movie, List<Movie>> {
  SubscribeMovieSuggestionsInteractor(this._deviceShakeNotificationsRepository);

  final DeviceShakeNotificationsRepository _deviceShakeNotificationsRepository;

  @override
  Stream<Movie> call(List<Movie> param) {
    final random = Random();

    return _deviceShakeNotificationsRepository.deviceShakeNotificationsStream
        .map(
          (_) {
            final index = random.nextInt(param.length - 1);

            return param[index];
          },
        );
  }
}
