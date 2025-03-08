import 'dart:convert';
import 'dart:developer';

import 'package:drift/drift.dart';

class ListTypeConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> fromSql(String fromDb) {
    return (jsonDecode(fromDb) as List<dynamic>)
        .map((e) => e as String)
        .toList();
  }

  @override
  String toSql(List<String> value) {
    log("Before saving $value");
    return jsonEncode(value);
  }
}
