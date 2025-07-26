import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_page.freezed.dart';

typedef PageNumber = int;

@freezed
sealed class PaginationPage<T> with _$PaginationPage<T> {
  const factory PaginationPage({
    required List<T> items,
    required PageNumber pageNumber,
    required bool isLastPage,
  }) = _PaginationPage<T>;
}
