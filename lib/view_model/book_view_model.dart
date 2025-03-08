import 'dart:developer';
import 'dart:io';

import 'package:bookworm/core/constants/view_state_enum.dart';
import 'package:bookworm/data/exceptions/app_exception.dart';
import 'package:bookworm/model/book_response_model.dart';
import 'package:bookworm/repository/book_repository.dart';
import 'package:flutter/material.dart';

class BookViewModel with ChangeNotifier {
  final BookRepository bookRepository;
  BookViewModel({required this.bookRepository});

  ViewState _currentViewState = ViewState.idel;

  ViewState get currentViewState => _currentViewState;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  late BookResponseModel _bookResponseModel;

  BookResponseModel get bookResponseModel => _bookResponseModel;

  set _changeViewState(ViewState newViewState) {
    if (newViewState != _currentViewState) {
      _currentViewState = newViewState;
      notifyListeners();
    }
  }

  void getBookDetails() async {
    try {
      _changeViewState = ViewState.loading;
      _bookResponseModel = await bookRepository.getBookDetails();
      _changeViewState = ViewState.sucess;
    } on AppException catch (e) {
      _errorMessage = e.message;
      _changeViewState = ViewState.error;
    } on SocketException {
      _errorMessage = "No internet connection.";
      _changeViewState = ViewState.error;
    } catch (e) {
      _errorMessage = "Something went wrong";
      _changeViewState = ViewState.error;
      log("An error occured $e");
    }
  }
}
