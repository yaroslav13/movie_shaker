import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_collection.freezed.dart';

@freezed
sealed class MovieCollection with _$MovieCollection {
  const factory MovieCollection({
    required String name,
  }) = _MovieCollection;

  const MovieCollection._({required this.name});

  static const favorites = MovieCollection(name: 'Favorites');

  @override
  final String name;
}
