import 'package:bookworm/core/constants/book_status.dart';
import 'package:bookworm/core/constants/view_state_enum.dart';
import 'package:bookworm/local_db/app_db.dart';
import 'package:bookworm/repository/reading_list_repository.dart';
import 'package:flutter/foundation.dart';

class ReadingListViewModel extends ChangeNotifier {
  final ReadingListRepository readingListRepository;
  ReadingListViewModel({required this.readingListRepository});

  late List<BookTableData> _bookTableData;

  List<BookTableData> get bookTableData => _bookTableData;

  BookStatus? _bookStatus;

  BookStatus? get bookStatus => _bookStatus;

  set selectBookStatus(BookStatus newBookStatus) {
    if (newBookStatus != _bookStatus) {
      _bookStatus = newBookStatus;
      notifyListeners();
    }
  }

  ViewState _currentViewState = ViewState.idel;

  ViewState get currentViewState => _currentViewState;

  set _changeViewState(ViewState newViewState) {
    if (newViewState != _currentViewState) {
      _currentViewState = newViewState;
      notifyListeners();
    }
  }

  void getAllSavedBooks({
    BookStatus? status,
  }) async {
    try {
      _changeViewState = ViewState.loading;
      _bookTableData =
          await readingListRepository.getSavedBooks(status: status);
      _changeViewState = ViewState.sucess;
    } catch (e) {
      _changeViewState = ViewState.error;
    }
  }

  void deleteBookById({
    required String id,
  }) async {
    try {
      _changeViewState = ViewState.loading;
      await readingListRepository.removeBook(id: id);
      _bookTableData.removeWhere((book) => book.id == id);
      _changeViewState = ViewState.sucess;
    } catch (e) {
      _changeViewState = ViewState.error;
    }
  }

  void addBook({
    required String id,
    required List<String> authors,
    required String imageUrl,
    required String title,
    required String language,
    required BookStatus status,
    required int pageCount,
  }) async {
    try {
      _changeViewState = ViewState.loading;
      await readingListRepository.saveBook(
          id: id,
          authors: authors,
          title: title,
          imageUrl: imageUrl,
          language: language,
          pageCount: pageCount,
          status: status);
      _changeViewState = ViewState.sucess;
    } catch (e) {
      _changeViewState = ViewState.error;
    } finally {
      _changeViewState = ViewState.idel;
    }
  }
}
