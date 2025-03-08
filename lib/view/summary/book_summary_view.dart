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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.item.volumeInfo?.imageLinks?.thumbnail ?? "",
              ),
            ),
            Chip(
              label: Text(
                "Author(s)",
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  (widget.item.volumeInfo?.authors.length) ?? 0,
                  (index) => Chip(
                    label: Text(
                      widget.item.volumeInfo?.authors[index] ?? "N/A",
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Summary",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Scrollbar(
                thumbVisibility: true,
                interactive: true,
                thickness: 5,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Text(
                    "This is the dummy book content " * 200,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
