import 'dart:async';

import 'package:movie_shaker/src/di/interactors/calculate_app_memory_usage_interactor_provider.dart';
import 'package:movie_shaker/src/di/interactors/clear_app_storage_interactor_provider.dart';
import 'package:movie_shaker/src/domain/exceptions/app_exception.dart';
import 'package:movie_shaker/src/presentation/features/storage_usage/storage_usage_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_usage_state_notifier.g.dart';

@riverpod
class StorageUsageStateNotifier extends _$StorageUsageStateNotifier {
  @override
  StorageUsageState build() {
    return const StorageUsageState();
  }

  void onStart() {
    unawaited(_calculateStorageUsage());
  }

  void onClearStoragePressed() {
    unawaited(_clearAppStorage());
  }

  Future<void> _calculateStorageUsage() async {
    try {
      final calculateAppMemoryUsageInteractor = ref.read(
        calculateAppMemoryUsageInteractorProvider,
      );

      final storageData = await calculateAppMemoryUsageInteractor();

      state = state.copyWith(
        storageUsedInGB: storageData.isEmpty ? 0 : storageData.usedInGB,
        isStorageEmpty: storageData.isEmpty,
      );
    } on SemanticException {
      /// TODO(yhalivets):
    }
  }

  Future<void> _clearAppStorage() async {
    final currentStorageUsedInGB = state.storageUsedInGB;
    final currentIsStorageEmpty = state.isStorageEmpty;

    try {
      state = state.copyWith(storageUsedInGB: 0, isStorageEmpty: true);

      final clearAppStorageInteractor = ref.read(
        clearAppStorageInteractorProvider,
      );

      await clearAppStorageInteractor();
    } on SemanticException {
      state = state.copyWith(
        storageUsedInGB: currentStorageUsedInGB,
        isStorageEmpty: currentIsStorageEmpty,
      );
    }
  }
}
