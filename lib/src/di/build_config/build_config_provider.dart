import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/domain/build_config/build_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'build_config_provider.g.dart';

@riverpod
BuildConfig buildConfig(Ref ref) {
  return BuildConfig();
}
