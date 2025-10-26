import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';

part 'movie_details_state.freezed.dart';

@freezed
sealed class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.loading() = MovieDetailsStateLoading;
  const factory MovieDetailsState.error(AppException exception) =
      MovieDetailsStateError;
  const factory MovieDetailsState.data({
    required String title,
    required String posterUrl,
  }) = MovieDetailsStateData;
}
