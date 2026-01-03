import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_usage_data.freezed.dart';

@freezed
sealed class StorageUsageData with _$StorageUsageData {
  const factory StorageUsageData({
    required double usedInGB,
    @Default(true) bool isEmpty,
  }) = _StorageUsageData;

  static const criticalThresholdInGB = 5.0;
}
