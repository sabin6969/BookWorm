import 'package:bookworm/core/constants/book_status.dart';
import 'package:bookworm/view_model/reading_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class BookWidget extends StatefulWidget {
  final bool isReadingList;
  final String? imageUrl;
  final String? title;
  final List<String> authors;
  final int? pages;
  final int? ratingsCount;
  final String id;
  final String? language;
  final num? rating;
  const BookWidget({
    super.key,
    required this.imageUrl,
    required this.authors,
    required this.title,
    required this.pages,
    required this.ratingsCount,
    required this.id,
    required this.language,
    required this.rating,
    this.isReadingList = false,
  });

  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 80,
              height: 120,
              child: Image.network(
                widget.imageUrl ?? 'https://via.placeholder.com/80x120',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Icon(
                      Icons.book_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title ?? "Title Not Available",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                      ),
                    ),
                    widget.isReadingList
                        ? IconButton(
                            onPressed: () {
                              context
                                  .read<ReadingListViewModel>()
                                  .deleteBookById(id: widget.id);
                            },
                            icon: const Icon(
                              Icons.delete,
                            ),
                          )
                        : PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  onTap: () {
                                    context
                                        .read<ReadingListViewModel>()
                                        .addBook(
                                          id: widget.id,
                                          authors: widget.authors,
                                          imageUrl: widget.imageUrl ?? "",
                                          title: widget.title ?? "Title N/A",
                                          language: widget.language ?? "N/A",
                                          status: BookStatus.toRead,
                                          pageCount: widget.pages ?? 0,
                                        );
                                  },
                                  child: Row(
                                    children: [
                                      Text("To read"),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  onTap: () {
                                    context
                                        .read<ReadingListViewModel>()
                                        .addBook(
                                          id: widget.id,
                                          authors: widget.authors,
                                          imageUrl: widget.imageUrl ?? "",
                                          title: widget.title ?? "Title N/A",
                                          language: widget.language ?? "N/A",
                                          status: BookStatus.currentlyReading,
                                          pageCount: widget.pages ?? 0,
                                        );
                                  },
                                  child: Text(
                                    "Currently Reading",
                                  ),
                                ),
                                PopupMenuItem(
                                  onTap: () {
                                    context
                                        .read<ReadingListViewModel>()
                                        .addBook(
                                          id: widget.id,
                                          authors: widget.authors,
                                          imageUrl: widget.imageUrl ?? "",
                                          title: widget.title ?? "Title N/A",
                                          language: widget.language ?? "N/A",
                                          status: BookStatus.read,
                                          pageCount: widget.pages ?? 0,
                                        );
                                  },
                                  child: Text("Read"),
                                )
                              ];
                            },
                          )
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  widget.authors.join(", "),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Info Row
                Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  children: [
                    _buildInfoChip(
                      icon: Icons.auto_stories_outlined,
                      label: "${widget.pages ?? 'N/A'} pages",
                    ),
                    _buildInfoChip(
                      icon: Icons.language_outlined,
                      label: widget.language?.toUpperCase() ?? 'N/A',
                    ),
                    _buildRatingChip(
                      rating: widget.rating ?? 0,
                      count: widget.ratingsCount ?? 0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip({required IconData icon, required String label}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }

  Widget _buildRatingChip({required num rating, required int count}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, size: 18, color: Colors.amber[700]),
        const SizedBox(width: 4),
        Text(
          rating > 0 ? '$rating ($count)' : 'No ratings',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}
