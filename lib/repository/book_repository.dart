import 'dart:convert';

import 'package:bookworm/core/constants/app_url.dart';
import 'package:bookworm/data/network/network_api.dart';
import 'package:bookworm/model/book_response_model.dart';

class BookRepository {
  final NetworkApi _networkApi = NetworkApi();

  Future<BookResponseModel> getBookDetails() async {
    try {
      var responseBody =
          await _networkApi.getRequest(uri: Uri.parse(AppUrl.booksApiEndPoint));
      return BookResponseModel.fromJson(jsonDecode(responseBody));
    } catch (e) {
      return Future.error(e);
    }
  }
}
