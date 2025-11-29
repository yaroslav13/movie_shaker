import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movie_collection/movie_collection.dart';

part 'movie_collection_entry.freezed.dart';

@freezed
sealed class MovieCollectionEntry with _$MovieCollectionEntry {
  factory MovieCollectionEntry({
    required MovieCollection collection,
    required Movie movie,
  }) = _MovieCollectionEntry;
}
