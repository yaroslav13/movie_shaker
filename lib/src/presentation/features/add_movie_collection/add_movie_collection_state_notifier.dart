import 'package:movie_shaker/src/presentation/features/add_movie_collection/add_movie_collection_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_movie_collection_state_notifier.g.dart';

@riverpod
class AddMovieCollectionStateNotifier
    extends _$AddMovieCollectionStateNotifier {
  @override
  AddMovieCollectionState build() {
    return const AddMovieCollectionState();
  }

  void onCollectionNameChanged(String name) {
    state = state.copyWith(collectionName: name);
  }
}
