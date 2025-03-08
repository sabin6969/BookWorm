import 'package:bookworm/local_db/app_tables.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'utils/type_converter.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      return driftDatabase(name: "bookworm");
    },
  );
}

@DriftDatabase(
  tables: [
    BookTable,
  ],
)
class Database extends _$Database {
  Database() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}
