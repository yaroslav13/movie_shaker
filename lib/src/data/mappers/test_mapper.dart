import 'package:movie_shaker/src/data/entities/test_data_entity.dart';
import 'package:movie_shaker/src/domain/base/base_mappers.dart';
import 'package:movie_shaker/src/domain/entities/test.dart';

final class TestMapper implements BaseMapper<TestDataEntity, Test> {
  @override
  Test map(TestDataEntity argument) {
    return Test();
  }
}
