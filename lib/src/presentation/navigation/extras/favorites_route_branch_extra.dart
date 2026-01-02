import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';

part 'favorites_route_branch_extra.freezed.dart';

abstract class FavoritesRouteBranchExtra {
  const FavoritesRouteBranchExtra();
}

@freezed
abstract class FavoritesRouteExtra extends FavoritesRouteBranchExtra
    with _$FavoritesRouteExtra {
  const FavoritesRouteExtra._() : super();

  const factory FavoritesRouteExtra.updateMovie({
    required int movieId,
  }) = FavoritesRouteExtraUpdateMovie;
}

@freezed
abstract class FavoriteMovieRouteExtra extends FavoritesRouteBranchExtra
    with _$FavoriteMovieRouteExtra {
  const FavoriteMovieRouteExtra._() : super();

  const factory FavoriteMovieRouteExtra.removeMovie({
    required int movieId,
  }) = FavoriteMovieRouteExtraRemoveMovie;

  const factory FavoriteMovieRouteExtra.addMovie({
    required Movie movie,
  }) = FavoriteMovieRouteExtraAddMovie;
}
