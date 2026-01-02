import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/mappers/dto/cast_member_dto_mapper.dart';
import 'package:movie_shaker/src/di/data_mappers/remote_image_url_mapper_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cast_member_dto_mapper_provider.g.dart';

@riverpod
CastMemberDtoMapper castMemberDtoMapper(Ref ref) {
  final remoteImageUrlMapper = ref.watch(remoteImageUrlMapperProvider);

  return CastMemberDtoMapper(remoteImageUrlMapper);
}
