import 'package:bookworm/core/di/service_locator.dart';
import 'package:bookworm/local_db/app_db.dart';
import 'package:bookworm/local_db/app_tables.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

class ReadingList extends StatefulWidget {
  const ReadingList({super.key});

  @override
  State<ReadingList> createState() => _ReadingListState();
}

class _ReadingListState extends State<ReadingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reading List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
