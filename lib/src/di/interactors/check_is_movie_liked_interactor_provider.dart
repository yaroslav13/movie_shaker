import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/movies_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/check_is_movie_liked_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_is_movie_liked_interactor_provider.g.dart';

@riverpod
CheckIsMovieLikedInteractor checkIsMovieLikedInteractor(Ref ref) {
  final moviesRepository = ref.watch(moviesRepositoryProvider);

  return CheckIsMovieLikedInteractor(moviesRepository);
}
