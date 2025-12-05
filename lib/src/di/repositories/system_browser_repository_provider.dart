import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/repositories/system_browser_repository_impl.dart';
import 'package:movie_shaker/src/domain/repositories/system_browser_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'system_browser_repository_provider.g.dart';

@riverpod
SystemBrowserRepository systemBrowserRepository(Ref ref) {
  return const SystemBrowserRepositoryImpl();
}
