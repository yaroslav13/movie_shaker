import 'package:movie_shaker/src/domain/base/base_interactors.dart';
import 'package:movie_shaker/src/domain/entities/contributor/contributor.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/domain/exceptions/infrastructure_exception.dart';
import 'package:movie_shaker/src/domain/repositories/casts_repository.dart';

final class GetMovieCastInteractor
    implements Interactor<List<CastMember>, int> {
  const GetMovieCastInteractor(
    this._castsRepository,
  );

  final CastsRepository _castsRepository;

  @override
  Future<List<CastMember>> call(int param) async {
    try {
      return await _castsRepository.getMovieCasts(param);
    } on InfrastructureException catch (e, s) {
      Error.throwWithStackTrace(SemanticException(e), s);
    }
  }
}
