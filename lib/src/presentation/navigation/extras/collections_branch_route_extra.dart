import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';

part 'collections_branch_route_extra.freezed.dart';

abstract class CollectionsBranchRouteExtra {
  const CollectionsBranchRouteExtra();
}

@freezed
abstract class CollectionsRouteExtra extends CollectionsBranchRouteExtra
    with _$CollectionsRouteExtra {
  const CollectionsRouteExtra._() : super();

  const factory CollectionsRouteExtra.addCollection({
    required String collectionName,
  }) = CollectionsRouteExtraAddCollection;

  const factory CollectionsRouteExtra.removeCollection({
    required String collectionName,
  }) = CollectionsRouteExtraRemoveCollection;

  const factory CollectionsRouteExtra.updateCollection({
    required String collectionName,
  }) = CollectionsRouteExtraUpdateCollection;
}

@freezed
abstract class CollectionDetailsRouteExtra extends CollectionsBranchRouteExtra
    with _$CollectionDetailsRouteExtra {
  const CollectionDetailsRouteExtra._() : super();

  const factory CollectionDetailsRouteExtra.removeMovie({
    required int movieId,
  }) = CollectionDetailsRouteExtraRemoveMovie;

  const factory CollectionDetailsRouteExtra.updateMovie({
    required int movieId,
  }) = CollectionDetailsRouteExtraUpdateMovie;
}

@freezed
abstract class CollectedMovieRouteExtra extends CollectionsBranchRouteExtra
    with _$CollectedMovieRouteExtra {
  const CollectedMovieRouteExtra._() : super();

  const factory CollectedMovieRouteExtra.saveMovie({
    required Movie movie,
  }) = CollectedMovieRouteExtraSaveMovie;
}
