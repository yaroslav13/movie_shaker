import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/features/test.dart';

void main() {
  runApp(
    const ProviderScope(
      child: TestWidget(),
    ),
  );
}
