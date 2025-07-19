import 'package:movie_shaker/src/data/datasources/test_datasource.dart';
import 'package:movie_shaker/src/data/mappers/test_mapper.dart';
import 'package:movie_shaker/src/domain/entities/test.dart';
import 'package:movie_shaker/src/domain/repositories/test_repository.dart';

final class TestRepositoryImpl implements TestRepository {
  const TestRepositoryImpl(this._datasource, this._testMapper);

  final TestDatasource _datasource;
  final TestMapper _testMapper;

  @override
  Future<Test> test() async {
    final entity = await _datasource.test();

    return _testMapper.map(entity);
  }
}
