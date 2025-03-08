import 'package:bookworm/core/constants/book_status.dart';
import 'package:bookworm/core/di/service_locator.dart';
import 'package:bookworm/core/extensions/book_status_extension.dart';
import 'package:bookworm/local_db/app_db.dart';
import 'package:drift/drift.dart';

class ReadingListRepository {
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
      await getIt.get<Database>().into(getIt.get<Database>().bookTable).insert(
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
      await getIt
          .get<Database>()
          .delete(getIt.get<Database>().bookTable)
          .delete(
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
}
