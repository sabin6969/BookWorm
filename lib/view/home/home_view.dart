import 'package:bookworm/view/home/widgets/book_widget.dart';
import 'package:bookworm/view_model/book_view_model.dart';
import 'package:bookworm/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/view_state_enum.dart';
import '../summary/book_summary_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (context.read<BookViewModel>().currentViewState !=
            ViewState.sucess) {
          context.read<BookViewModel>().getBookDetails();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Book Worm",
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeViewModel>().toogleTheme();
            },
            icon: Consumer<ThemeViewModel>(
              builder: (context, value, child) {
                return Icon(
                  value.isDarkTheme ? Icons.sunny : Icons.dark_mode,
                );
              },
            ),
          )
        ],
      ),
      body: Consumer<BookViewModel>(
        builder: (context, value, child) {
          switch (value.currentViewState) {
            case ViewState.loading:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ViewState.sucess:
              return RefreshIndicator(
                onRefresh: () async => value.getBookDetails(),
                child: ListView.builder(
                  itemCount: value.bookResponseModel.items.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookSummaryView(
                              title: value.bookResponseModel.items[index]
                                      .volumeInfo?.title ??
                                  "Title N/A",
                              authors: value.bookResponseModel.items[index]
                                      .volumeInfo?.authors ??
                                  [],
                              thumbnailUrl: value.bookResponseModel.items[index]
                                      .volumeInfo?.imageLinks?.thumbnail ??
                                  "",
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                        child: BookWidget(
                          id: value.bookResponseModel.items[index].id ?? "",
                          authors: value.bookResponseModel.items[index]
                                  .volumeInfo?.authors ??
                              [],
                          imageUrl: value.bookResponseModel.items[index]
                              .volumeInfo?.imageLinks?.thumbnail,
                          language: value.bookResponseModel.items[index]
                              .volumeInfo?.language,
                          pages: (value.bookResponseModel.items[index]
                                  .volumeInfo?.pageCount)
                              ?.toInt(),
                          rating: value.bookResponseModel.items[index]
                              .volumeInfo?.averageRating,
                          title: value
                              .bookResponseModel.items[index].volumeInfo?.title,
                          ratingsCount: (value.bookResponseModel.items[index]
                                  .volumeInfo?.ratingsCount)
                              ?.toInt(),
                        ),
                      ),
                    );
                  },
                ),
              );
            case ViewState.error:
              return SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      value.errorMessage ?? "An unknown error occured!",
                    ),
                    TextButton(
                      onPressed: () {
                        value.getBookDetails();
                      },
                      child: const Text(
                        "Retry",
                      ),
                    )
                  ],
                ),
              );
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
