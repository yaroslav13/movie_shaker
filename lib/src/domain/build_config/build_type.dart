abstract final class _BuildValues {
  const _BuildValues._();

  static const dev = 'dev';
  static const prod = 'prod';
}

enum BuildType {
  dev(_BuildValues.dev),
  prod(_BuildValues.prod);

  const BuildType(this.value);

  final String value;

  static BuildType fromValue(String value) {
    switch (value) {
      case _BuildValues.dev:
        return BuildType.dev;
      case _BuildValues.prod:
        return BuildType.prod;
    }
    throw Exception('Unknown environment type $value');
  }
}
