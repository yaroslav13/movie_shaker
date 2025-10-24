import 'package:flutter/foundation.dart';

abstract interface class BaseMapper<From, To> {
  To? map(From? argument);
}

abstract interface class BaseBiMapper<From, To> extends BaseMapper<From, To> {
  From? reverseMap(To? argument);
}

mixin SafeMapper<From, To> implements BaseMapper<From, To> {
  To mapSafe(From instance);

  @override
  To? map(From? instance) {
    if (instance == null) {
      return null;
    }
    try {
      return mapSafe(instance);
    } on Object catch (e, s) {
      debugPrint('Error during mapping: $e\n$s');

      return null;
    }
  }
}
