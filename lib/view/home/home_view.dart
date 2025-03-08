import 'package:bookworm/view/home/widgets/book_widget.dart';
import 'package:bookworm/view_model/book_view_model.dart';
import 'package:bookworm/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/view_state_enum.dart';

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
        context.read<BookViewModel>().getBookDetails();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            icon: Icon(
              context.read<ThemeViewModel>().isDarkTheme
                  ? Icons.sunny
                  : Icons.dark_mode,
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BookWidget(
                        item: value.bookResponseModel.items[index],
                      ),
                    );
                  },
                ),
              );
            case ViewState.error:
              return Center(
                child: Text("An error occured"),
              );
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
