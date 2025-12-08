import 'package:dio/dio.dart';
import 'package:movie_shaker/src/data/datasources/remote/credits_remote_datasource.dart';
import 'package:movie_shaker/src/data/mappers/dto/cast_member_dto_mapper.dart';
import 'package:movie_shaker/src/domain/entities/contributor/contributor.dart';
import 'package:movie_shaker/src/domain/exceptions/network_exception.dart';
import 'package:movie_shaker/src/domain/repositories/casts_repository.dart';

final class CastsRepositoryImpl implements CastsRepository {
  const CastsRepositoryImpl(
    this._creditsRemoteDatasource,
    this._castMemberDtoMapper,
  );

  final CreditsRemoteDatasource _creditsRemoteDatasource;
  final CastMemberDtoMapper _castMemberDtoMapper;

  @override
  Future<List<CastMember>> getMovieCasts(int movieId) async {
    try {
      final response = await _creditsRemoteDatasource.getMovieCredits(
        movieId: movieId,
      );

      final cast = response.cast
          .map(_castMemberDtoMapper.map)
          .nonNulls
          .toList();

      return cast;
    } on DioException catch (e, s) {
      final error = e.error;

      Error.throwWithStackTrace(error ?? const UnknownNetworkException(), s);
    }
  }
}
