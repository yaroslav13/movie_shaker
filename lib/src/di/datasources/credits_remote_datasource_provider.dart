import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/datasources/remote/credits_remote_datasource.dart';
import 'package:movie_shaker/src/di/network/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'credits_remote_datasource_provider.g.dart';

@riverpod
CreditsRemoteDatasource creditsRemoteDatasource(Ref ref) {
  final dio = ref.watch(dioProvider);

  return CreditsRemoteDatasource(dio);
}
