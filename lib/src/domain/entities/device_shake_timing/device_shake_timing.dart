abstract final class DeviceShakeTiming {
  const DeviceShakeTiming._();

  static const minShakeInterval = Duration(milliseconds: 150);

  static const shakeStopTimeout = Duration(milliseconds: 500);

  static const verifiedShakeDuration = Duration(milliseconds: 600);
}
