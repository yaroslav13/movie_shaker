import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/presentation/features/movie_details/movie_details_state_notifier.dart';

final class MovieDetailsScreen extends HookConsumerWidget {
  const MovieDetailsScreen({required this.movieId, super.key});

  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        ref.read(movieDetailsStateNotifierProvider.notifier).onStart(movieId);

        return;
      },
      const [],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: const Center(
        child: Text('Details of the selected movie will be shown here.'),
      ),
    );
  }
}
