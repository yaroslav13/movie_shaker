import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/domain/entities/genre/genre.dart';
import 'package:movie_shaker/src/domain/entities/movie/movie.dart';
import 'package:movie_shaker/src/domain/entities/movies_filter/movies_filter.dart';
import 'package:movie_shaker/src/presentation/features/collect_movie/collect_movie_button.dart';
import 'package:movie_shaker/src/presentation/features/home/delegates/home_movie_shaker_delegate.dart';
import 'package:movie_shaker/src/presentation/features/home/home_state_notifier.dart';
import 'package:movie_shaker/src/presentation/features/like_movie/movie_like_button.dart';
import 'package:movie_shaker/src/presentation/features/movie_shaker/entities/movie_pool.dart';
import 'package:movie_shaker/src/presentation/features/movie_shaker/movie_shaker_scope.dart';
import 'package:movie_shaker/src/presentation/navigation/routes.dart';
import 'package:rxdart/rxdart.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

part 'widgets/shake_effect_widget.dart';

const _moviesSearchDebounceTime = Duration(milliseconds: 200);

final class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  void _onMovieSelected(BuildContext context, Movie movie) {
    MovieDetailsRoute(id: movie.id).go(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateNotifierProvider);

    final paginationState = state.paginationState;
    final shouldBeScrollable = paginationState.items.isNotEmpty;

    final isDeviceShaking = useState(false);

    return Scaffold(
      body: NestedScrollView(
        physics: shouldBeScrollable
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (_, innerBoxIsScrolled) => [
          _Header(innerBoxIsScrolled: innerBoxIsScrolled),
        ],
        body: MovieShakerScope(
          scopeId: 'home_screen_scope',
          pool: MoviePool.global(
            filter: MoviesFilter(genres: [?state.selectedGenre]),
          ),
          delegate: HomeMovieShakerDelegate(
            onShakeStateChanged: (value) => isDeviceShaking.value = value,
          ),
          child: PullToRefreshWidget(
            onRefresh: () async =>
                ref.read(homeStateNotifierProvider.notifier).onPullToRefresh(),
            child: PagedStaggeredGridView<Movie>(
              paginationState: paginationState,
              onNextPage: () => ref
                  .read(homeStateNotifierProvider.notifier)
                  .onMoviesGridViewBottomReached(),
              onReload: () => ref
                  .read(homeStateNotifierProvider.notifier)
                  .onReloadPressed(),
              itemBuilder: (_, movie, index) {
                return _ShakeEffectWidget(
                  isShaking: isDeviceShaking.value,
                  child: MovieCard(
                    action: MovieLikeButton(movie: movie),
                    leading: CollectMovieButton(movie: movie),
                    imageUrl: movie.posterUrl,
                    onTap: () => _onMovieSelected(context, movie),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

final class _Header extends HookConsumerWidget {
  const _Header({
    required this.innerBoxIsScrolled,
  });

  final bool innerBoxIsScrolled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final inputStreamController = useStreamController<String>();

    useEffect(
      () {
        ref.read(homeStateNotifierProvider.notifier).onStart();

        return;
      },
      const [],
    );

    useEffect(
      () {
        final searchInputListener = () {
          final input = searchController.text;
          inputStreamController.add(input);
        };

        searchController.addListener(searchInputListener);

        return () {
          searchController.removeListener(searchInputListener);
        };
      },
      const [],
    );

    useEffect(
      () {
        final subscription = inputStreamController.stream
            .debounceTime(_moviesSearchDebounceTime)
            .listen((input) {
              ref
                  .read(homeStateNotifierProvider.notifier)
                  .onSearchInputChanged(input);
            });

        return () async {
          await subscription.cancel();
          await inputStreamController.close();
        };
      },
      const [],
    );

    final state = ref.watch(homeStateNotifierProvider);

    return SliverPersistentHeader(
      delegate: MsAppBarDelegate.withSearchAndFilter<Genre>(
        context: context,
        forceElevated: innerBoxIsScrolled,
        searchController: searchController,
        filterItems: state.availableGenres,
        filterLabelBuilder: (_, item) => item.name,
        selectedFilterItem: state.selectedGenre,
        onFilterSelected: (genre) =>
            ref.read(homeStateNotifierProvider.notifier).onGenreSelected(genre),
      ),
      pinned: true,
    );
  }
}
