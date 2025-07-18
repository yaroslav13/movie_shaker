import 'package:movie_shaker/src/entities/test.dart';

abstract interface class TestDatasource {
  Future<Test> test();
}

final class TestDatasourceImpl implements TestDatasource {
  @override
  Future<Test> test() async {
    await Future<void>.delayed(const Duration(seconds: 1));

    return Test();
  }
}
