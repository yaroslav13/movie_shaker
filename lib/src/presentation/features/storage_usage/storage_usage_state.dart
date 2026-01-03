import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_usage_state.freezed.dart';

@freezed
sealed class StorageUsageState with _$StorageUsageState {
  const factory StorageUsageState({
    @Default(0.0) double storageUsedInGB,
    @Default(true) bool isStorageEmpty,
  }) = _StorageUsageState;
}
