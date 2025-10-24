import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/genre/genre.dart';

part 'movie_details.freezed.dart';

@freezed
sealed class MovieDetails with _$MovieDetails {
  const factory MovieDetails({
    required int id,
    required String title,
    required String overview,
    required String posterUrl,
    required int runtime,
    required double voteAverage,
    required int voteCount,
    required DateTime releaseDate,
    required double popularity,
    @Default(<Genre>[]) List<Genre> genres,
    String? tagline,
    String? homepageUrl,
  }) = _MovieDetails;
}
