import 'package:meta/meta_meta.dart';

@Target({
  TargetKind.method,
  TargetKind.function,
  TargetKind.getter,
})
final class Throws {
  const Throws(this.exceptions);

  final List<Type> exceptions;
}
