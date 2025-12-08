import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_dto.freezed.dart';
part 'credit_dto.g.dart';

@freezed
sealed class CreditDto with _$CreditDto {
  const factory CreditDto({
    bool? adult,
    int? gender,
    int? id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    double? popularity,
    String? profilePath,
    String? creditId,
    String? department,
    String? character,
    String? job,
  }) = _CreditDto;

  factory CreditDto.fromJson(Map<String, Object?> json) =>
      _$CreditDtoFromJson(json);
}
