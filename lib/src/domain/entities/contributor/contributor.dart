import 'package:freezed_annotation/freezed_annotation.dart';

part 'contributor.freezed.dart';

@freezed
sealed class Contributor with _$Contributor {
  const factory Contributor.cast({
    required int id,
    required String name,
    required String photoUrl,
    required String character,
  }) = CastMember;

  const factory Contributor.crew({
    required int id,
    required String name,
    required String? photoUrl,
    required String job,
    required String department,
  }) = CrewMember;
}
