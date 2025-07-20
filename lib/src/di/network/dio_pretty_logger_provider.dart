import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_pretty_logger_provider.g.dart';

@riverpod
PrettyDioLogger prettyDioLogger(Ref ref) {
  return PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
  );
}
