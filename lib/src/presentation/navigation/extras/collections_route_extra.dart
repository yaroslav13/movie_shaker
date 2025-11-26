import 'package:freezed_annotation/freezed_annotation.dart';

part 'collections_route_extra.freezed.dart';

@freezed
sealed class CollectionsRouteExtra with _$CollectionsRouteExtra {
  const factory CollectionsRouteExtra({
    required String newCollectionName,
  }) = _CollectionsRouteExtra;
}
