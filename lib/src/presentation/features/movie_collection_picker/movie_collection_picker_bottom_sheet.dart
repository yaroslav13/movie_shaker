import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/presentation/features/movie_collection_picker/movie_collection_picker_state.dart';
import 'package:movie_shaker/src/presentation/features/movie_collection_picker/movie_collection_picker_state_notifier.dart';
import 'package:movie_shaker/src/presentation/hooks/throttle_hook.dart';
import 'package:ui_components/ui_components.dart';

const _interactionThrottleDuration = Duration(milliseconds: 300);

final class MovieCollectionPickerBottomSheet extends HookConsumerWidget {
  const MovieCollectionPickerBottomSheet({
    required this.selectedMovie,
    super.key,
  });

  final Movie selectedMovie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final viewPadding = MediaQuery.viewPaddingOf(context);

    final state = ref.watch(
      movieCollectionPickerStateNotifierProvider(movie: selectedMovie),
    );

    useEffect(
      () {
        ref
            .read(
              movieCollectionPickerStateNotifierProvider(
                movie: selectedMovie,
              ).notifier,
            )
            .onStart();

        return;
      },
      const [],
    );

    final throttle = useThrottle(_interactionThrottleDuration);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.45,
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: viewPadding.bottom),
        child: switch (state) {
          MovieCollectionPickerStateLoading() => Center(
            child: MsProgressIndicator.moviePosters(),
          ),
          MovieCollectionPickerStateError() => LoadingErrorStub(
            useSafeArea: false,
            onRetry: () => ref
                .read(
                  movieCollectionPickerStateNotifierProvider(
                    movie: selectedMovie,
                  ).notifier,
                )
                .onRetryPressed(),
          ),
          MovieCollectionPickerStateData(:final allCollections) =>
            allCollections.isEmpty
                ? NoItemsStub.noSelectionAvailable(useSafeArea: false)
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: allCollections.length,
                    itemBuilder: (_, index) {
                      final collection = allCollections[index];
                      final isSelected = state.selectedCollections.contains(
                        collection,
                      );

                      final onTap = () => throttle(
                        () => ref
                            .read(
                              movieCollectionPickerStateNotifierProvider(
                                movie: selectedMovie,
                              ).notifier,
                            )
                            .onCollectionSelected(collection),
                      );

                      return MsListTile(
                        title: MsText(collection.name),
                        trailing: isSelected
                            ? MsIcon.outlinedCheckmark()
                            : null,
                        onTap: onTap,
                      );
                    },
                  ),
        },
      ),
    );
  }
}
