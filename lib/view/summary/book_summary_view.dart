import 'package:bookworm/view/reading/reading_view.dart';
import 'package:flutter/material.dart';

class BookSummaryView extends StatefulWidget {
  final String title;
  final List<String> authors;
  final String thumbnailUrl;
  const BookSummaryView({
    super.key,
    required this.title,
    required this.authors,
    required this.thumbnailUrl,
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
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookReadingView(
                    title: widget.title,
                    authors: widget.authors,
                    thumbnailUrl: widget.thumbnailUrl,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.visibility,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.thumbnailUrl,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.error,
                  );
                },
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
                  (widget.authors.length),
                  (index) => Chip(
                    label: Text(
                      widget.authors[index],
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
