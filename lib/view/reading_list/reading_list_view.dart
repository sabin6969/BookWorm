import 'package:bookworm/core/constants/app_asset_path.dart';
import 'package:bookworm/core/constants/book_status.dart';
import 'package:bookworm/core/extensions/book_status_extension.dart';
import 'package:bookworm/local_db/app_db.dart';
import 'package:bookworm/main.dart' show size;
import 'package:bookworm/view/home/widgets/book_widget.dart';
import 'package:bookworm/view/summary/book_summary_view.dart';
import 'package:bookworm/view_model/reading_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/view_state_enum.dart';

class ReadingList extends StatefulWidget {
  const ReadingList({super.key});

  @override
  State<ReadingList> createState() => _ReadingListState();
}

class _ReadingListState extends State<ReadingList> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<ReadingListViewModel>().getAllSavedBooks(
              status: context.read<ReadingListViewModel>().bookStatus,
            );
      },
    );
    _textEditingController = TextEditingController();

    _textEditingController.addListener(
      () {
        context.read<ReadingListViewModel>().searchQuery =
            _textEditingController.text;
        context.read<ReadingListViewModel>().searchByTitle();
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reading List"),
        actions: [
          Selector<ReadingListViewModel, BookStatus>(
            builder: (context, value, child) {
              return DropdownButton(
                underline: SizedBox(),
                hint: Text(
                  context.read<ReadingListViewModel>().bookStatus == null
                      ? "Select Category"
                      : context
                          .read<ReadingListViewModel>()
                          .bookStatus!
                          .readableString,
                ),
                items: BookStatus.values
                    .map(
                      (status) => DropdownMenuItem(
                        value: status,
                        child: Text(
                          status.readableString,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  context.read<ReadingListViewModel>().selectBookStatus =
                      value ?? BookStatus.currentlyReading;
                  context.read<ReadingListViewModel>().getAllSavedBooks(
                        status: context.read<ReadingListViewModel>().bookStatus,
                      );
                },
              );
            },
            selector: (p0, p1) => p1.bookStatus ?? BookStatus.read,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Consumer<ReadingListViewModel>(
        builder: (context, value, child) {
          switch (value.currentViewState) {
            case ViewState.error:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text("An error occured!"),
                  ),
                  TextButton(
                    onPressed: () {
                      value.getAllSavedBooks();
                    },
                    child: const Text(
                      "Retry",
                    ),
                  )
                ],
              );
            case ViewState.sucess:
              return value.bookTableData.isEmpty
                  ? Column(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          height: size.height * 0.25,
                          width: size.width * 0.5,
                          AppAssetPath.emptyImagePath,
                        ),
                        Center(
                          child: Text(
                            "${value.bookStatus == null ? "Reading List" : "${value.bookStatus!.readableString} List"} is empty try adding some!",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        TextFormField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            suffixIcon: value.searchQuery.isNotEmpty
                                ? IconButton(
                                    onPressed: () {
                                      _textEditingController.clear();
                                    },
                                    icon: const Icon(
                                      Icons.clear,
                                    ),
                                  )
                                : null,
                            hintText: "Search by title",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: value.searchQuery.isNotEmpty
                              ? value.searchedBookTableData.isEmpty
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "No results found for book titled ${value.searchQuery}",
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    )
                                  : ListView.builder(
                                      itemCount:
                                          value.searchedBookTableData.length,
                                      itemBuilder: (context, index) {
                                        BookTableData data =
                                            value.searchedBookTableData[index];
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BookSummaryView(
                                                  title: data.bookTitle,
                                                  thumbnailUrl: data.imageUrl,
                                                  authors: data.authors,
                                                ),
                                              ),
                                            );
                                          },
                                          child: BookWidget(
                                            imageUrl: data.imageUrl,
                                            authors: data.authors,
                                            title: data.bookTitle,
                                            pages: data.pages,
                                            ratingsCount: 0,
                                            id: data.id,
                                            language: data.language,
                                            rating: 0,
                                            isReadingList: true,
                                          ),
                                        );
                                      },
                                    )
                              : ListView.builder(
                                  itemCount: value.bookTableData.length,
                                  itemBuilder: (context, index) {
                                    BookTableData data =
                                        value.bookTableData[index];
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BookSummaryView(
                                              title: data.bookTitle,
                                              thumbnailUrl: data.imageUrl,
                                              authors: data.authors,
                                            ),
                                          ),
                                        );
                                      },
                                      child: BookWidget(
                                        imageUrl: data.imageUrl,
                                        authors: data.authors,
                                        title: data.bookTitle,
                                        pages: data.pages,
                                        ratingsCount: 0,
                                        id: data.id,
                                        language: data.language,
                                        rating: 0,
                                        isReadingList: true,
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ],
                    );
            case ViewState.loading:
              return const Center(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case ViewState.idel:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
