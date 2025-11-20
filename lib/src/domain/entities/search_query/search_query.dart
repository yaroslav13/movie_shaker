import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movies_filter/movies_filter.dart';
import 'package:movie_shaker/src/domain/entities/pagination_page/pagination_page.dart';

part 'search_query.freezed.dart';

@freezed
sealed class SearchQuery with _$SearchQuery {
  factory SearchQuery({
    required String query,
    required PageNumber page,
    MoviesFilter? filter,
  }) {
    return filter == null
        ? SearchQuery.filterless(query: query, page: page)
        : SearchQuery.filterRich(query: query, page: page, filter: filter);
  }

  const factory SearchQuery.filterless({
    required String query,
    required PageNumber page,
  }) = FilterlessSearchQuery;

  const factory SearchQuery.filterRich({
    required String query,
    required PageNumber page,
    required MoviesFilter filter,
  }) = FilterRichSearchQuery;

  const SearchQuery._();
}
