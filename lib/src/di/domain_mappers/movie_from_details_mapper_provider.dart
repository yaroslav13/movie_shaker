import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/domain/mappers/movie_from_details_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_from_details_mapper_provider.g.dart';

@riverpod
MovieFromDetailsMapper movieFromDetailsMapper(Ref ref) {
  return const MovieFromDetailsMapper();
}
