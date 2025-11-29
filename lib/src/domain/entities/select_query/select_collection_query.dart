import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';

part 'select_collection_query.freezed.dart';

@freezed
sealed class SelectCollectionQuery with _$SelectCollectionQuery {
  factory SelectCollectionQuery.byMovieId({
    required List<MovieCollection> collections,
    required int movieId,
  }) = _SelectCollectionQueryByMovieId;
}
