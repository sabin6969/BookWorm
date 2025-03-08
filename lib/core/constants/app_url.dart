import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrl {
  static String booksApiEndPoint =
      "https://www.googleapis.com/books/v1/volumes?q=flower+inauthor:keyes&key=${dotenv.get("api_key")}";
}
