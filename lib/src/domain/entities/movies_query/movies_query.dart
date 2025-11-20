import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movies_filter/movies_filter.dart';
import 'package:movie_shaker/src/domain/entities/pagination_page/pagination_page.dart';

part 'movies_query.freezed.dart';

@freezed
sealed class MoviesQuery with _$MoviesQuery {
  const factory MoviesQuery({
    required PageNumber pageNumber,
    MoviesFilter? filter,
  }) = _MoviesQuery;
}
