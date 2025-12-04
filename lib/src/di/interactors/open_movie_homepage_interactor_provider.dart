import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/repositories/system_browser_repository_provider.dart';
import 'package:movie_shaker/src/domain/interactors/open_movie_homepage_interactor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'open_movie_homepage_interactor_provider.g.dart';

@riverpod
OpenMovieHomepageInteractor openMovieHomepageInteractor(Ref ref) {
  final systemBrowserRepository = ref.watch(systemBrowserRepositoryProvider);

  return OpenMovieHomepageInteractor(systemBrowserRepository);
}
