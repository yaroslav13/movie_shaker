import 'package:drift/drift.dart';

@DataClassName('CollectionDbo')
class Collections extends Table {
  TextColumn get name => text().withLength(min: 1)();

  BoolColumn get isDefault => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {name};
}
