import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/repositories/casts_repository_impl.dart';
import 'package:movie_shaker/src/di/datasources/credits_remote_datasource_provider.dart';
import 'package:movie_shaker/src/di/mappers/cast_member_dto_mapper_provider.dart';
import 'package:movie_shaker/src/domain/repositories/casts_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'casts_repository_provider.g.dart';

@riverpod
CastsRepository castsRepository(Ref ref) {
  final creditsRemoteDatasource = ref.watch(creditsRemoteDatasourceProvider);
  final castMemberDtoMapper = ref.watch(castMemberDtoMapperProvider);

  return CastsRepositoryImpl(creditsRemoteDatasource, castMemberDtoMapper);
}
