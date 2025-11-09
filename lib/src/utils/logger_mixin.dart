import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

mixin LoggerMixin {
  String get _tag => '$runtimeType ${identityHashCode(this)}';

  @protected
  Logger get logger;

  @nonVirtual
  @protected
  void info(Object message, [Object? error, StackTrace? stackTrace]) {
    logger.i(
      _buildLogMessage(message),
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
  }

  @nonVirtual
  @protected
  void warning(Object message, [Object? error, StackTrace? stackTrace]) {
    logger.w(
      _buildLogMessage(message),
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
  }

  @nonVirtual
  @protected
  void error(Object message, [Object? error, StackTrace? stackTrace]) {
    logger.e(
      _buildLogMessage(message),
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
  }

  @nonVirtual
  @protected
  void fine(Object message, [Object? error, StackTrace? stackTrace]) {
    logger.f(
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
