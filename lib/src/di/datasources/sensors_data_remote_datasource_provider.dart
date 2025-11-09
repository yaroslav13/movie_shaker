import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/datasources/remote/sensors_data_remote_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sensors_data_remote_datasource_provider.g.dart';

@riverpod
SensorsDataRemoteDatasource sensorsDataRemoteDatasource(Ref ref) {
  return const SensorsDataRemoteDatasource();
}
