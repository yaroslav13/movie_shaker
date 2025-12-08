import 'package:movie_shaker/src/data/entities/remote_image/remote_image.dart';
import 'package:movie_shaker/src/domain/base/base_mappers.dart';
import 'package:movie_shaker/src/domain/build_config/build_config.dart';

final class RemoteImageUrlMapper with SafeMapper<RemoteImage, String> {
  const RemoteImageUrlMapper(this._buildConfig);

  final BuildConfig _buildConfig;

  @override
  String mapSafe(RemoteImage instance) {
    return '${_buildConfig.baseImageUrl}/${instance.resolution}/${instance.imagePath}';
  }
}
