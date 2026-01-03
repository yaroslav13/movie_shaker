import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localization/localization.dart';
import 'package:movie_shaker/src/domain/entities/storage_usage_data/storage_usage_data.dart';
import 'package:movie_shaker/src/presentation/features/storage_usage/storage_usage_state_notifier.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

final class StorageUsageScreen extends HookConsumerWidget {
  const StorageUsageScreen({super.key});

  String _formatStorageUsed(BuildContext context, double storageUsedInGB) {
    final localizations = context.localizations;

    final bytes = (storageUsedInGB * pow(1024, 3)).toInt();

    if (bytes <= 0) {
      return '0 ${localizations.unitB}';
    }

    final units = [
      localizations.unitB,
      localizations.unitKB,
      localizations.unitMB,
      localizations.unitGB,
    ];

    final i = (log(bytes) / log(1024)).floor().clamp(0, units.length - 1);

    final result = bytes / pow(1024, i);

    final formattedValue = i == 0
        ? result.toInt().toString()
        : result.toStringAsFixed(2);

    return localizations.fileSizeDisplay(
      formattedValue,
      units[i],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(storageUsageStateNotifierProvider);

    useEffect(
      () {
        ref.read(storageUsageStateNotifierProvider.notifier).onStart();

        return;
      },
      const [],
    );

    final scoreArcTheme = Theme.of(context).extension<ScoreArcTheme>();

    return Scaffold(
      appBar: MsAppBar.titleText(title: context.localizations.storage),
      body: Center(
        child: Padding(
          padding: MsEdgeInsets.contentExtraLarge,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              ScoreArc(
                value: state.storageUsedInGB,
                valueColors: scoreArcTheme?.valueColors?.reversed.toList(),
                endValue: StorageUsageData.criticalThresholdInGB,
                labelBuilder: (value) => _formatStorageUsed(context, value),
              ),
              const Spacer(),
              MsElevatedButton(
                onPressed: state.isStorageEmpty
                    ? null
                    : () => ref
                          .read(storageUsageStateNotifierProvider.notifier)
                          .onClearStoragePressed(),
                child: MsText(context.localizations.clearStorage.toUpperCase()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
