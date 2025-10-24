import 'package:movie_shaker/src/data/exceptions/property_not_found_exception.dart';

extension ObjectX<T extends Object?> on T? {
  V getNotNullObjectPropertyOrThrow<V>(
    V? Function(T) getter,
    String propertyName,
  ) {
    if (this == null) {
      throw PropertyNotFoundException<V>(object: this);
    }

    final value = getter(this as T);
    if (value == null) {
      throw PropertyNotFoundException<V>(object: this);
    }

    return value;
  }
}
