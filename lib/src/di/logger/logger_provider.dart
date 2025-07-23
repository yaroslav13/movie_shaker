import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:movie_shaker/src/di/build_config/build_config_provider.dart';
import 'package:movie_shaker/src/domain/build_config/build_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logger_provider.g.dart';

@riverpod
Logger logger(Ref ref) {
  final buildConfig = ref.watch(buildConfigProvider);

  return Logger(
    filter: _LogFilter(buildConfig),
    printer: PrettyPrinter(),
  );
}

final class _LogFilter extends LogFilter {
  _LogFilter(this._buildConfig);

  final BuildConfig _buildConfig;

  @override
  bool shouldLog(LogEvent event) {
    return _buildConfig.enableLogs;
  }
}
