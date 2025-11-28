import 'package:meta/meta_meta.dart';

@Target({
  TargetKind.method,
  TargetKind.function,
})
final class Throws {
  const Throws(this.exceptions);

  final List<Type> exceptions;
}
