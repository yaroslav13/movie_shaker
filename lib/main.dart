import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/movie_shaker_app.dart';

void main() {
  runZonedGuarded(
    () => runApp(
      const ProviderScope(child: MovieShakerApp()),
    ),
    (error, stackTrace) {
      // TODO(yhalivets): Send errors to crahslytics
      debugPrint('Error: $error. StackTrace: $stackTrace');
    },
  );
}
