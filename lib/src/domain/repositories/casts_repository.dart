import 'package:movie_shaker/src/domain/entities/contributor/contributor.dart';

abstract interface class CastsRepository {
  Future<List<CastMember>> getMovieCasts(int movieId);
}
