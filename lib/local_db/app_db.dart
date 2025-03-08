import 'dart:io';

import 'package:bookworm/local_db/app_tables.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'utils/type_converter.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'bookworm.sqlite'));
      return NativeDatabase(file);
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
