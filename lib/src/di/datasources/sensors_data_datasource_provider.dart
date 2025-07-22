import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/datasources/sensors/sensors_data_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sensors_data_datasource_provider.g.dart';

@riverpod
SensorsDataDatasource sensorsDataDatasource(Ref ref) {
  return SensorsDataDatasource();
}
