import 'package:bookworm/core/constants/book_status.dart';
import 'package:bookworm/core/di/service_locator.dart';
import 'package:bookworm/core/extensions/book_status_extension.dart';
import 'package:bookworm/local_db/app_db.dart';
import 'package:drift/drift.dart';

class ReadingListRepository {
  final Database _database = getIt.get<Database>();

  Future<void> saveBook({
    required String id,
    required List<String> authors,
    required String title,
    required String imageUrl,
    required String language,
    required int pageCount,
    required BookStatus status,
  }) async {
    try {
      await _database.into(_database.bookTable).insert(
            BookTableCompanion(
              id: Value(id),
              authors: Value(authors),
              bookTitle: Value(title),
              imageUrl: Value(imageUrl),
              language: Value(language),
              pages: Value(pageCount),
              status: Value(
                status.readableString,
              ),
            ),
          );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> removeBook({
    required String id,
  }) async {
    try {
      await _database.delete(_database.bookTable).delete(
            BookTableCompanion(
              id: Value(
                id,
              ),
            ),
          );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<BookTableData>> getSavedBooks({
    BookStatus? status,
  }) async {
    try {
      final query = _database.select(_database.bookTable);
      if (status != null) {
        query.where(
          (tbl) => tbl.status.equals(status.readableString),
        );
      }
      return await query.get();
    } catch (e) {
      return Future.error(e);
    }
  }
}
