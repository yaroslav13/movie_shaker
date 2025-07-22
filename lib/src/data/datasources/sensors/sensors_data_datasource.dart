import 'package:sensors_plus/sensors_plus.dart';

abstract interface class SensorsDataDatasource {
  factory SensorsDataDatasource() = _SensorsDataDatasource;

  Stream<UserAccelerometerEvent> subscribeAccelerometer();
}

final class _SensorsDataDatasource implements SensorsDataDatasource {
  const _SensorsDataDatasource();

  @override
  Stream<UserAccelerometerEvent> subscribeAccelerometer() {
    return userAccelerometerEventStream();
  }
}
