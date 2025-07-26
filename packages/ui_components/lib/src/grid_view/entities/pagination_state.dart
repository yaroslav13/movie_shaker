import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
final class PaginationState<T> {
  const PaginationState({
    this.pages,
    this.keys,
    this.error,
    this.hasNextPage = true,
    this.isLoading = false,
  });

  final List<List<T>>? pages;
  final List<int>? keys;
  final Object? error;
  final bool hasNextPage;
  final bool isLoading;

  List<T> get items => pages?.expand((page) => page).toList() ?? [];
  int get pagesCount => pages?.length ?? 0;

  PaginationState<T> copyWith({
    List<List<T>>? pages,
    List<int>? keys,
    Object? error,
    bool? hasNextPage,
    bool? isLoading,
  }) {
    return PaginationState<T>(
      pages: pages ?? this.pages,
      keys: keys ?? this.keys,
      error: error ?? this.error,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is! PaginationState<T>) {
      return false;
    }

    return const DeepCollectionEquality().equals(pages, other.pages) &&
        listEquals(keys, other.keys) &&
        error == other.error &&
        hasNextPage == other.hasNextPage &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    return Object.hash(
      const DeepCollectionEquality().hash(pages),
      keys,
      error,
      hasNextPage,
      isLoading,
    );
  }
}
