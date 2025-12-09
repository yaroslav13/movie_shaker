import 'package:sensors_plus/sensors_plus.dart';

final class SensorsDataRemoteDatasource {
  const SensorsDataRemoteDatasource();

  Stream<AccelerometerEvent> subscribeAccelerometer() {
    return accelerometerEventStream();
  }
}
