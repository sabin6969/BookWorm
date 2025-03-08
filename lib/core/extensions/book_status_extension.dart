import 'package:bookworm/core/constants/book_status.dart';

extension BookStatusExtension on BookStatus {
  String get readableString {
    switch (this) {
      case BookStatus.currentlyReading:
        return "Currently Reading";
      case BookStatus.read:
        return "Read";
      case BookStatus.toRead:
        return "To Read";
    }
  }
}
