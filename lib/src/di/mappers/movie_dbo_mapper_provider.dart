import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/mappers/dbo/movie_dbo_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_dbo_mapper_provider.g.dart';

@riverpod
MovieDboMapper movieDboMapper(Ref ref) {
  return MovieDboMapper();
}
