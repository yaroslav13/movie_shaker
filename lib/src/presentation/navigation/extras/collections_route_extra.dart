import 'package:freezed_annotation/freezed_annotation.dart';

part 'collections_route_extra.freezed.dart';

@freezed
sealed class CollectionsRouteExtra with _$CollectionsRouteExtra {
  const factory CollectionsRouteExtra.add({
    required String collectionName,
  }) = AddCollectionsRouteExtra;

  const factory CollectionsRouteExtra.remove({
    required String collectionName,
  }) = RemoveCollectionsRouteExtra;

  const factory CollectionsRouteExtra.removeMovie({
    required String collectionName,
    required int movieId,
  }) = RemoveMovieCollectionsRouteExtra;

  const factory CollectionsRouteExtra.updated({
    required String collectionName,
  }) = UpdatedCollectionsRouteExtra;
}
