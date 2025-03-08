import 'package:bookworm/model/book_response_model.dart';
import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  final Item item;
  const BookWidget({
    super.key,
    required this.item,
  });

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
                item.volumeInfo?.imageLinks?.thumbnail ??
                    'https://via.placeholder.com/80x120',
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
                        item.volumeInfo?.title ?? "Title Not Available",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                      ),
                    ),
                    PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            onTap: () {
                              // TODO:
                            },
                            child: Row(
                              children: [
                                Text("To read"),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              // TODO:
                            },
                            child: Text(
                              "Currently Reading",
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              // TODO:
                            },
                            child: Text("Read"),
                          )
                        ];
                      },
                    )
                  ],
                ),
                const SizedBox(height: 8),

                if (item.volumeInfo?.authors != null)
                  Text(
                    item.volumeInfo!.authors.join(", "),
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
                      label: "${item.volumeInfo?.pageCount ?? 'N/A'} pages",
                    ),
                    _buildInfoChip(
                      icon: Icons.language_outlined,
                      label: item.volumeInfo?.language?.toUpperCase() ?? 'N/A',
                    ),
                    _buildRatingChip(
                      rating: item.volumeInfo?.averageRating ?? 0,
                      count: item.volumeInfo?.ratingsCount ?? 0,
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
