import 'package:dart_code_metrics_annotations/annotations.dart';
import 'package:movie_shaker/src/domain/exceptions/system_browser_launch_exception.dart';

abstract interface class SystemBrowserRepository {
  @Throws({SystemBrowserLaunchException})
  Future<void> launchUrl(Uri url);
}
