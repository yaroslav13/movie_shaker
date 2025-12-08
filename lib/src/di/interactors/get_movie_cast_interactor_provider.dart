import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/casts_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/get_movie_cast_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_cast_interactor_provider.g.dart';

@riverpod
GetMovieCastInteractor getMovieCastInteractor(Ref ref) {
  final castsRepository = ref.watch(castsRepositoryProvider);

  return GetMovieCastInteractor(castsRepository);
}
