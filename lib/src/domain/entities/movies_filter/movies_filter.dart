import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/genre/genre.dart';

part 'movies_filter.freezed.dart';

@freezed
sealed class MoviesFilter with _$MoviesFilter {
  const factory MoviesFilter({
    List<Genre>? genres,
  }) = _MoviesFilter;
}
