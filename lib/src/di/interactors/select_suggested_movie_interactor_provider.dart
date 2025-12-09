import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/domain/interactors/select_suggested_movie_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'select_suggested_movie_interactor_provider.g.dart';

@riverpod
SelectSuggestedMovieInteractor selectSuggestedMovieInteractor(Ref ref) {
  return const SelectSuggestedMovieInteractor();
}
