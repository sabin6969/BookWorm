import 'dart:convert';

import 'package:drift/drift.dart';

class ListTypeConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> fromSql(String fromDb) {
    return jsonDecode(fromDb);
  }

  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}
