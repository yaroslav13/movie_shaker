import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';

part 'home_branch_route_extra.freezed.dart';

abstract class HomeBranchRouteExtra {
  const HomeBranchRouteExtra();
}

@freezed
abstract class HomeRouteExtra extends HomeBranchRouteExtra
    with _$HomeRouteExtra {
  const HomeRouteExtra._() : super();

  const factory HomeRouteExtra.updateMovie({
    required int movieId,
  }) = HomeRouteExtraUpdateMovie;

  const factory HomeRouteExtra.addMovie({
    required Movie movie,
  }) = HomeRouteExtraAddMovie;
}

@freezed
abstract class MovieDetailsRouteExtra extends HomeBranchRouteExtra
    with _$MovieDetailsRouteExtra {
  const MovieDetailsRouteExtra._() : super();

  const factory MovieDetailsRouteExtra.saveMovie({
    required Movie movie,
  }) = MovieDetailsRouteExtraSaveMovie;

  const factory MovieDetailsRouteExtra.removeMovie({
    required int movieId,
  }) = MovieDetailsRouteExtraRemoveMovie;
}
