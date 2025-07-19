import 'package:movie_shaker/src/data/entities/test_data_entity.dart';

final class TestDatasource {
  Future<TestDataEntity> test() async {
    await Future<void>.delayed(const Duration(seconds: 1));

    return const TestDataEntity();
  }
}
