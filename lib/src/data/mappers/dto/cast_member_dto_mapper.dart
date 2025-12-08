import 'package:movie_shaker/src/data/entities/credit/credit_dto.dart';
import 'package:movie_shaker/src/data/entities/remote_image/remote_image.dart';
import 'package:movie_shaker/src/data/extensions/object_x.dart';
import 'package:movie_shaker/src/data/mappers/remote_image_url_mapper.dart';
import 'package:movie_shaker/src/data/shared/image_resolutions.dart';
import 'package:movie_shaker/src/domain/base/base_mappers.dart';
import 'package:movie_shaker/src/domain/entities/contributor/contributor.dart';

final class CastMemberDtoMapper with SafeMapper<CreditDto, CastMember> {
  const CastMemberDtoMapper(
    this._remoteImageUrlMapper,
  );

  final RemoteImageUrlMapper _remoteImageUrlMapper;

  @override
  CastMember mapSafe(CreditDto instance) {
    final id = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.id,
      'CreditDto.id',
    );

    final name = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.name,
      'CreditDto.name',
    );

    final character = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.character,
      'CreditDto.character',
    );

    final profilePath = instance.getNotNullObjectPropertyOrThrow(
      (it) => it.profilePath,
      'CreditDto.profilePath',
    );

    final profileUrl = _remoteImageUrlMapper.mapSafe(
      RemoteImage(
        resolution: ImageResolutions.original,
        imagePath: profilePath,
      ),
    );

    return CastMember(
      id: id,
      name: name,
      character: character,
      photoUrl: profileUrl,
    );
  }
}
