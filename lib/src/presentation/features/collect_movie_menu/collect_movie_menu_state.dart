import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';

part 'collect_movie_menu_state.freezed.dart';

@freezed
sealed class CollectMovieMenuState with _$CollectMovieMenuState {
  const factory CollectMovieMenuState({
    required Movie correspondingMovie,
    @Default(false) bool isLiked,
  }) = _CollectMovieMenuState;
}
