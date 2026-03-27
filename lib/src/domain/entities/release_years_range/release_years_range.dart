import 'package:freezed_annotation/freezed_annotation.dart';

part 'release_years_range.freezed.dart';

@freezed
sealed class ReleaseYearsRange with _$ReleaseYearsRange {
  const factory ReleaseYearsRange({
    required int from,
    required int to,
  }) = _ReleaseYearsRange;

  factory ReleaseYearsRange.max() => ReleaseYearsRange(
    from: ReleaseYearsRange.minYear,
    to: ReleaseYearsRange.maxYear,
  );

  const ReleaseYearsRange._();

  static int get minYear => 1874;
  static int get maxYear => DateTime.now().year;
}
