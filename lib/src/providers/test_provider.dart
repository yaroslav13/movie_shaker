import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/datasources/test_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test_provider.g.dart';

@riverpod
TestDatasource testDatasource(Ref ref) {
  return TestDatasourceImpl();
}
