import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/repositories/device_shake_notifications_repository_impl.dart';
import 'package:movie_shaker/src/di/datasources/sensors_data_remote_datasource_provider.dart';
import 'package:movie_shaker/src/domain/repositories/device_shake_notifications_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_shake_notifications_repository_provider.g.dart';

@riverpod
DeviceShakeNotificationsRepository deviceShakeNotificationsRepository(Ref ref) {
  final sensorsDataRemoteDatasource = ref.watch(
    sensorsDataRemoteDatasourceProvider,
  );

  return DeviceShakeNotificationsRepositoryImpl(sensorsDataRemoteDatasource);
}
