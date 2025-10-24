import 'package:flutter/foundation.dart';

@immutable
final class PropertyNotFoundException<V> implements Exception {
  const PropertyNotFoundException({
    required this.object,
  });

  final Object? object;

  @override
  String toString() {
    return 'PropertyNotFoundException: '
        'Property of type $V not found in object $object';
  }
}
