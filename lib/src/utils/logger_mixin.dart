import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_shaker/src/di/logger/logger_provider.dart';

mixin LoggerMixin<T> on AutoDisposeNotifier<T> {
  String get _tag => '$runtimeType ${identityHashCode(this)}';

  @nonVirtual
  @protected
  void info(Object message, [Object? error, StackTrace? stackTrace]) {
    ref
        .read(loggerProvider)
        .i(
          _buildLogMessage(message),
          time: DateTime.now(),
          error: error,
          stackTrace: stackTrace,
        );
  }

  @nonVirtual
  @protected
  void warning(Object message, [Object? error, StackTrace? stackTrace]) {
    ref
        .read(loggerProvider)
        .w(
          _buildLogMessage(message),
          time: DateTime.now(),
          error: error,
          stackTrace: stackTrace,
        );
  }

  @nonVirtual
  @protected
  void error(Object message, [Object? error, StackTrace? stackTrace]) {
    ref
        .read(loggerProvider)
        .e(
          _buildLogMessage(message),
          time: DateTime.now(),
          error: error,
          stackTrace: stackTrace,
        );
  }

  @nonVirtual
  void fine(Object message, [Object? error, StackTrace? stackTrace]) {
    ref
        .read(loggerProvider)
        .f(
          _buildLogMessage(message),
          time: DateTime.now(),
          error: error,
          stackTrace: stackTrace,
        );
  }

  String _buildLogMessage(Object message) {
    return '$_tag >> $message';
  }
}
