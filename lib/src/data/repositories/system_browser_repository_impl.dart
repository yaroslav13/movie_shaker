import 'package:movie_shaker/src/domain/exceptions/system_browser_launch_exception.dart';
import 'package:movie_shaker/src/domain/repositories/system_browser_repository.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

final class SystemBrowserRepositoryImpl implements SystemBrowserRepository {
  const SystemBrowserRepositoryImpl();

  @override
  Future<void> launchUrl(Uri url) async {
    try {
      final canLaunchUrl = await url_launcher.canLaunchUrl(url);

      if (!canLaunchUrl) {
        throw const SystemBrowserLaunchException();
      }

      await url_launcher.launchUrl(
        url,
        mode: url_launcher.LaunchMode.externalApplication,
      );
    } on SystemBrowserLaunchException {
      rethrow;
    } on Exception catch (_, s) {
      Error.throwWithStackTrace(
        const SystemBrowserLaunchException(),
        s,
      );
    }
  }
}
