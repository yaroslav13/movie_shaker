import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/data/repositories/movie_preferences_repository_impl.dart';
import 'package:movie_shaker/src/di/data_mappers/movie_preferences_dto_mapper_provider.dart';
import 'package:movie_shaker/src/di/shared_preferences/shared_preferences_provider.dart';
import 'package:movie_shaker/src/domain/repositories/movie_preferences_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_preferences_repository_provider.g.dart';

@riverpod
MoviePreferencesRepository moviePreferencesRepository(Ref ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  final moviePreferencesDtoMapper = ref.watch(
    moviePreferencesDtoMapperProvider,
  );

  return MoviePreferencesRepositoryImpl(
    sharedPreferences,
    moviePreferencesDtoMapper,
  );
}
