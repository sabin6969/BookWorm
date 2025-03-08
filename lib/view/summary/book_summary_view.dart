import 'package:bookworm/model/book_response_model.dart';
import 'package:flutter/material.dart';

class BookSummaryView extends StatefulWidget {
  final Item item;
  const BookSummaryView({
    super.key,
    required this.item,
  });

  @override
  State<BookSummaryView> createState() => BookSummaryViewState();
}

class BookSummaryViewState extends State<BookSummaryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.item.volumeInfo?.title ?? "Title N/A",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
