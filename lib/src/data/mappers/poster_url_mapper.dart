import 'package:movie_shaker/src/data/entities/poster/poster.dart';
import 'package:movie_shaker/src/domain/base/base_mappers.dart';
import 'package:movie_shaker/src/domain/build_config/build_config.dart';

final class PosterUrlMapper with SafeMapper<Poster, String> {
  const PosterUrlMapper(this._buildConfig);

  final BuildConfig _buildConfig;

  @override
  String mapSafe(Poster instance) {
    return '${_buildConfig.baseImageUrl}/${instance.resolution}/${instance.posterPath}';
  }
}
