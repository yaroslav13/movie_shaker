import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/pagination_page/pagination_page.dart';

part 'search_query.freezed.dart';

@freezed
sealed class SearchQuery with _$SearchQuery {
  const factory SearchQuery({
    required String query,
    required PageNumber page,
  }) = _SearchQuery;
}
