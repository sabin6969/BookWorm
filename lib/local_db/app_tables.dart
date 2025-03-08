import 'package:drift/drift.dart';
import 'package:bookworm/local_db/utils/type_converter.dart';

class BookTable extends Table {
  TextColumn get id => text()();
  TextColumn get bookTitle => text()();
  TextColumn get imageUrl => text()();
  TextColumn get status => text()();

  TextColumn get authors => text().map(ListTypeConverter())();

  IntColumn get pages => integer().withDefault(const Constant(0))();
  TextColumn get language => text().withDefault(const Constant("en"))();

  @override
  Set<Column> get primaryKey => {id};
}
