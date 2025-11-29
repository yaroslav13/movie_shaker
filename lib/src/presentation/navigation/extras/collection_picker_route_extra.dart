import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';

part 'collection_picker_route_extra.freezed.dart';

@freezed
sealed class CollectionPickerRouteExtra with _$CollectionPickerRouteExtra {
  const factory CollectionPickerRouteExtra({
    required Movie movie,
  }) = _CollectionPickerRouteExtra;
}
