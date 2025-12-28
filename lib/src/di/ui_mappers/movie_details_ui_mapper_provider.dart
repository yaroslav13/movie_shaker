import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/presentation/features/movie_details/ui_mappers/movie_details_ui_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_details_ui_mapper_provider.g.dart';

@riverpod
MovieDetailsUiMapper movieDetailsUiMapper(Ref ref, {required int movieId}) {
  return MovieDetailsUiMapper(movieId);
}
