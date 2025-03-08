import 'dart:developer';

import 'package:bookworm/core/constants/book_status.dart';
import 'package:bookworm/core/constants/view_state_enum.dart';
import 'package:bookworm/repository/reading_list_repository.dart';
import 'package:flutter/foundation.dart';

class ReadingListViewModel extends ChangeNotifier {
  final ReadingListRepository readingListRepository;
  ReadingListViewModel({required this.readingListRepository});

  ViewState _currentViewState = ViewState.sucess;

  ViewState get currentViewState => _currentViewState;

  set _changeViewState(ViewState newViewState) {
    if (newViewState != _currentViewState) {
      _currentViewState = newViewState;
      notifyListeners();
    }
  }

  void deleteBookById({
    required String id,
  }) async {
    try {
      _changeViewState = ViewState.loading;
      await readingListRepository.removeBook(id: id);
      _changeViewState = ViewState.error;
    } catch (e) {
      log("Error aayo $e");
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
      log("Relax i got it!");
    } catch (e) {
      log("Relax i did not got it! $e");
      _changeViewState = ViewState.error;
    }
  }
}
