import 'package:freezed_annotation/freezed_annotation.dart';

part 'poster.freezed.dart';

@freezed
sealed class Poster with _$Poster {
  const factory Poster({
    required String posterPath,
    required String resolution,
  }) = _Poster;
}
