import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/mappers/dbo/movie_collection_dbo_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_collection_dbo_mapper_provider.g.dart';

@riverpod
MovieCollectionDboMapper movieCollectionDboMapper(Ref ref) {
  return MovieCollectionDboMapper();
}
