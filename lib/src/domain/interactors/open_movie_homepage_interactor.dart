import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/exceptions/movie_homepage_unavailable_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/system_browser_launch_exception.dart';
import 'package:movie_shaker/src/domain/repositories/system_browser_repository.dart';

final class OpenMovieHomepageInteractor implements Interactor<void, String> {
  const OpenMovieHomepageInteractor(
    this._systemBrowserRepository,
  );

  final SystemBrowserRepository _systemBrowserRepository;

  @override
  Future<void> call(String param) async {
    try {
      final uri = Uri.parse(param);

      return await _systemBrowserRepository.launchUrl(uri);
    } on SystemBrowserLaunchException catch (e, s) {
      Error.throwWithStackTrace(MovieHomepageUnavailableException(e), s);
    }
  }
}
